class AddSlugToImageGalleries < ActiveRecord::Migration
  def change
  	add_column :image_galleries, :slug, :string
  	add_index :image_galleries, :slug, unique: true
  end
end
