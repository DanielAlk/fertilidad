class AddAttachmentImageToImageGalleryItems < ActiveRecord::Migration
  def self.up
    change_table :image_gallery_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :image_gallery_items, :image
  end
end
