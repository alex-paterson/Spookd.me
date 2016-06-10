class ArticlesController < ApplicationController
	before_action :admin_user, except: [:index, :show]
	before_action :set_article, only: [:show, :edit, :update, :destroy]

	def show
		if @article.related_articles && @article.related_articles != ""
			str = @article.related_articles
			arr = str.split(",")
			arr.each_with_index do |d, i|
				arr[i] = d.strip()
			end
			@related_articles = []
			arr.each do |d|
				begin 
					@a = Article.find(d)
					@related_articles.append(@a)
				rescue
					puts("Do nothing.")
				end
			end
		else
			@related_articles = Article.all.where(public: true).take(8)
		end
		if @article.public = false && !current_user.admin
			flash[:danger] = "Permission denied."
			redirect_to root_url
		end
	end

	def new 
		@article = Article.new
	end

	def edit
	end

	def create
	    @article = current_user.articles.build(article_params)
	    if @article.save
      	flash[:success] = "Article was successfully created."
	        redirect_to @article
	    else
	        render :new
	    end
	end

	def update
      if @article.update(article_params)
      	flash[:success] = "Article was successfully updated."
        redirect_to @article
      else
        render :edit
      end
    end

	def destroy
		@article.destroy!
      	flash[:success] = "Article was successfully destroyed."
		redirect_to root_url
	end

	private

		def admin_user
			if !current_user || !current_user.admin 
      			flash[:danger] = "Permission denied."
				redirect_to root_url
			end
		end

		def set_article
			@article = Article.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title, :tagline, :content, :all_tags, :public, :cover, :related_articles)
		end

end
