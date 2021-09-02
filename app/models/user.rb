class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # validates :profile_picture, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  has_one_attached :profile_picture
  
  has_many :publications, dependent: :destroy
  has_many :califications, dependent: :destroy
  has_many :donations, dependent: :destroy


  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

  def self.find_for_facebook_oauth(auth)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    return user if user
    user = User.where(email: auth.info.email).first
    return user if user
    User.create(
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      avatar: auth.info.image,
      password: Devise.friendly_token[0, 20]
    )
  end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user| 
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.name = auth.info.name 
  #   end
  # end
end
