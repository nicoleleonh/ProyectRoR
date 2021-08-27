class Publication < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many_attached :documents
  has_many :califications, dependent: :destroy
  has_many :donations
  has_many :payments


  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

end
