class AddAllTagsToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :all_tags_string, :string
  end
end
