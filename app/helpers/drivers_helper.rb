module DriversHelper
	def profile_car_image_for(driver, size = '300')
    	image_tag "/docs/#{driver.car_image}", size: size, class: :gravatar
  	end
end
