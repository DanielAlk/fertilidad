class ImageGallery < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	has_many :image_gallery_items, :dependent => :destroy

	def items
		self.image_gallery_items
	end

	def cover(style)
		item = self.items.first
		return item.present? ? item.image.url(style) : "gallery-image-default-original.jpg"
	end

end
