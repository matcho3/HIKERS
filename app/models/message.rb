class Message < ActiveRecord::Base
	belongs_to :sending, class_name: "User"
	belongs_to :receiving, class_name: "User"

	default_scope -> { order('created_at DESC') }
	
    validates :sending_id, presence: true
    validates :receiving_id, presence: true
    validates :content, length: { maximum: 140 }
end
