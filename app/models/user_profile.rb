class UserProfile < ActiveRecord::Base
	belongs_to :user
	# validates :name, presence: true, length: { maximum: 50 }

	def set_image(file)
		if !file.nil?
			file_name = file.original_filename
			File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
			self.image = file_name
		end
	end
end
