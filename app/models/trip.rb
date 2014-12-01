class Trip < ActiveRecord::Base
	belongs_to :driver
	validates :departure, presence: true #地名じゃなきゃダメ 
	validates :destination, presence: true #地名じゃなきゃだめ
	validates :leaving_time, presence: true #日時じゃなきゃダメ
	validates :capacity, presence: true #数字じゃなきゃダメ
	validates :price, presence: true #数字じゃなきゃだめ
	has_many :books, dependent: :destroy
	
end
