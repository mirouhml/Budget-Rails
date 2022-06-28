class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :payment_categories
  has_many :payments, through: :payment_categories

  validates :name, presence: true

  def number_of_transactions
    case payments.count
    when 0
      'No transactions'
    when 1
      '1 transaction'
    else
      "#{payments.count} transactions"
    end
  end

  def total_transactions
    total = 0
    payments.each do |payment|
      total += payment.amount
    end
    "$#{total}"
  end
end
