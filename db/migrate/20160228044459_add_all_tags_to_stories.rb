class AddAllTagsToStories < ActiveRecord::Migration
  def change
  	add_column :stories, :all_tags_string, :string
  end
end
