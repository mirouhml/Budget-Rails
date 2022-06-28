class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :payment_categories
  has_many :payments, through: :payment_categories

  validates :name, presence: true

  def number_of_transactions
    if payments.count == 0
      'No transactions'
    elsif payments.count == 1
      '1 transaction'
    else
      "#{payments.count} transactions"
    end
  end
end
