class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :profile_picture, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  has_one_attached :profile_picture

  has_many :publications, dependent: :destroy

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end
end
