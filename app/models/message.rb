class Message < ActiveRecord::Base
	belongs_to :sending, class_name: "User"
	belongs_to :receiving, class_name: "User"
    validates :from_user_id, presence: true
    validates :to_user_id, presence: true
end
