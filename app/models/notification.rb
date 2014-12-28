class Notification < ActiveRecord::Base
	belongs_to :user
	belongs_to :review
	belongs_to :book
end
