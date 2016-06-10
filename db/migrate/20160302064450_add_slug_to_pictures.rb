class AddSlugToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :slug, :string, unique: true
  end
end
