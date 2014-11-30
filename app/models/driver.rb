class Driver < ActiveRecord::Base
	belongs_to :user
	has_many :trips

	validates :license_history, presence: true

	def set_car_image(file)
    	if !file.nil?
      	 file_name = file.original_filename
      	 File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      	 self.car_image = file_name
    	end
  	end

  	def Driver.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def Driver.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
		self.remember_token = Driver.encrypt(Driver.new_remember_token)
	end

end
