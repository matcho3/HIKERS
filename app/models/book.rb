class Book < ActiveRecord::Base
	belongs_to :user
	belongs_to :trip
	# belongs_to :notification
end
