class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :username
      t.text :description
      t.integer :followers
      t.integer :frequency
      t.string :fullname
      t.string :url
      t.integer :user_id
      t.boolean :verified, default: false

      t.timestamps null: false
    end
  end
end
