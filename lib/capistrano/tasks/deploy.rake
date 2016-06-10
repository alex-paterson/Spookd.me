namespace :deploy do

  desc "Makes sure local git is in sync with remote."
  task :check_revision do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end

  desc "Create shared symlinks."
  task :create_symlinks do
    on roles(:app) do
      execute "ln -fs #{shared_path}/config/database.yml #{current_path}/config/database.yml"
      execute "ln -fs #{shared_path}/config/s3-credentials.yml #{current_path}/config/s3-credentials.yml"
    end
  end

  %w[start stop restart].each do |command|
    desc "#{command} Unicorn server."
    task command do
      on roles(:app) do
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end
    end
  end



  before :deploy, "deploy:check_revision"
  after :deploy, "deploy:restart"
  after :deploy, "deploy:create_symlinks"
  after :rollback, "deploy:restart"

end