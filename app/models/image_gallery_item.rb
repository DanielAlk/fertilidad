class ImageGalleryItem < ActiveRecord::Base
  belongs_to :image_gallery
  has_attached_file :image, styles: { thumb: "270x270#" }, :default_url => 'gallery-image-default-:style.jpg'
	validates_attachment_content_type :image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/
end
