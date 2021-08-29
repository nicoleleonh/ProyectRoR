class Donation < ApplicationRecord
  belongs_to :publication
  belongs_to :user
  has_many :payments


  scope :confirmed, -> { where(paid: true) }

  validates :amount, presence: true



end
