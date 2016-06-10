class CreateTagStory < ActiveRecord::Migration
  def change
    create_table :tag_stories do |t|
      t.integer :story_id
      t.integer :tag_id

      t.timestamps null: false
    end
    add_index :tag_stories, [:story_id, :tag_id], unique: true
  end
end
