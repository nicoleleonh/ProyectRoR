class Publication < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many_attached :documents
  has_many :califications, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :payments


  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']


  def confirmed_donations_amount
    donations.confirmed.sum(:amount)
  end


  def check_status_amount
    if amountoraise <= confirmed_donations_amount
      update(available: false)
    end
  end
end
