module DriversHelper
	def profile_car_image_for(driver, size = '265')
    	image_tag "/docs/#{driver.car_image}", size: size, class: :car_icon
  	end
end
