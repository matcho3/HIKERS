class Message < ActiveRecord::Base
	belongs_to :sending, class_name: "User"
	belongs_to :receiving, class_name: "User"
    validates :sending_id, presence: true
    validates :receiving_id, presence: true
end
