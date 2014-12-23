class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :recoverable,
         :registerable, :rememberable, :trackable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_many :messages
  has_many :reviews, dependent: :destroy
  has_many :books
  has_one :driver

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/docs/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end

  # # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  # def self.create_unique_string
  #   SecureRandom.uuid
  # end
 
  # # twitterではemailを取得できないので、適当に一意のemailを生成
  # def self.create_unique_email
  #   User.create_unique_string + "@example.com"
  # end

  # send message
  has_many :sending_messages, foreign_key: "from_user_id", class_name: "Messages", dependent: :destroy
  has_many :sendings, through: :sending_messages
  
  # receive message
  has_many :receiving_messages, foreign_key: "to_user_id", class_name: "Messages", dependent: :destroy
  has_many :receivings, through: :receiving_relationships

	# send messageする関数
	def send!(other_user)
		sending_messages.create!(to_user_id: other_user.id)
	end

end




