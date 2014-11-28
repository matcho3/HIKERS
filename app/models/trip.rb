class Trip < ActiveRecord::Base
	belongs_to :driver
	#validates :departure
end
