module ImageGalleriesHelper
	def gallery_item_class
		unless browser.mobile?
			'clean gallery-trigger'
		else
			'clean'
		end
	end
end
