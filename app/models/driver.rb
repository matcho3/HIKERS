class Driver < ActiveRecord::Base
	has_one :user
	has_many :trip

	def set_car_image(file)
    	if !file.nil?
      	 file_name = file.original_filename
      	 File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      	 self.car_image = file_name
    	end
  	end
end
