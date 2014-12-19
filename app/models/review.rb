class Review < ActiveRecord::Base
	belongs_to :driver
	belongs_to :user	
	default_scope -> { order('created_at DESC') }
  validates :comment, length: { maximum: 140 }
end

