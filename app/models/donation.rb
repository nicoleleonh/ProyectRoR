class Donation < ApplicationRecord
  belongs_to :publication
  belongs_to :user
  has_many :payments

  after_save :check_publications_status, if: :paid_completed?


  scope :confirmed, -> { where(paid: true) }

  validates :amount, presence: true


  private

  def paid_completed?
    paid
  end

  def check_publications_status
    publication.check_status_amount
  end




end
