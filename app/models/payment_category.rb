class PaymentCategory < ApplicationRecord
  belongs_to :payment
  belongs_to :category

  validates :payment, presence: true
  validates :category, presence: true
end
