class CreateImageGalleryItems < ActiveRecord::Migration
  def change
    create_table :image_gallery_items do |t|
      t.references :image_gallery, index: true, foreign_key: true
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
