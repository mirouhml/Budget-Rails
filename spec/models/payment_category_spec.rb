require 'rails_helper'

describe PaymentCategory, type: :model do
  subject do
    user = User.create(name: 'John Doe', email: 'john@something.com', password: '123456', confirmed_at: Time.now)
    category = Category.create(name: 'Category 1', icon: 'Icon 1', author: user)
    payment = Payment.create(name: 'Payment 1', amount: 40, author: user)
    PaymentCategory.new(payment: payment, category: category)
  end

  before { subject.save }

  it 'payment should be present' do
    subject.payment = nil
    expect(subject).to_not be_valid
  end

  it 'category should be present' do
    subject.category = nil
    expect(subject).to_not be_valid
  end
end