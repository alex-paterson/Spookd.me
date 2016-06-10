class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :story_id
      t.integer :user_id
      t.string :title
      t.string :description
      t.datetime :time_taken

      t.timestamps null: false
    end
  end
end
