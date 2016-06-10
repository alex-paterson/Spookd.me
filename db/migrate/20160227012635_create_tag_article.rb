class CreateTagArticle < ActiveRecord::Migration
  def change
    create_table :tag_articles do |t|
      t.integer :article_id
      t.integer :tag_id

      t.timestamps null: false
    end
    add_index :tag_articles, [:article_id, :tag_id], unique: true
  end
end
