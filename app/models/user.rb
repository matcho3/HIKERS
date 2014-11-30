class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }, on: :update
	validates :birthday, :presence => true, on: :update

	before_create :create_remember_token
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, on: :create
	validates :password, length: { minimum: 6 }, on: :create
	has_one :user_profile
	has_many :reviews, dependent: :destroy
	has_many :books, dependent: :destroy
	#ユーザーが削除された時、ツイートも一緒に削除されるように。
	has_one :driver, dependent: :destroy

	has_secure_password

	def set_image(file)
		if !file.nil?
			file_name = file.original_filename
			File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
			self.image = file_name
		end
	end


	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end

	
end
