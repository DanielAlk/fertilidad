class Download < ActiveRecord::Base
	include ActionView::Helpers::NumberHelper
	has_attached_file :file
	validates_attachment_content_type :file, content_type: /^image\/.*|text\/html|application\/pdf|video\/.*$/

	def type
		if self.file_content_type =~ /^image\/.*$/
			'image'
		elsif self.file_content_type =~ /^text\/html|application\/pdf$/
			'document'
		elsif self.file_content_type =~ /^video\/.*$/
			'video'
		end
	end

	def short
		short = self.description[0..90]
		if short < self.description
			short + '...'
		else
			short
		end
	end

	def name
		self.file_file_name
	end

	def size
		number_to_human_size self.file_file_size
	end

	def date
		self.file_updated_at.strftime '%-d/%-m/%Y'
	end

	def name_no_ext
		if self.name.present?
			self.name.sub(/\.[^\.]+$/, '')
		end
	end
end
