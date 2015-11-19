class ImageGalleryItem < ActiveRecord::Base
  belongs_to :image_gallery
  has_attached_file :image, styles: { thumb: "270x270#" }, :default_url => 'gallery-image-default-:style.jpg'
	validates_attachment_content_type :image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

	def next
		item = self.image_gallery.items.where('id > ?', self.id).first
		if item.blank?
			item = self.image_gallery.items.first
		end
		item
	end

	def prev
		item = self.image_gallery.items.where('id < ?', self.id).last
		if item.blank?
			item = self.image_gallery.items.last
		end
		item
	end
end
