require 'rails_helper'

describe Payment, type: :model do
  subject do
    user = User.create(name: 'John Doe', email: 'john@something.com', password: '123456', confirmed_at: Time.now)
    Payment.new(name: 'Payment 1', amount: 40, author: user)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be greater than 0' do
    subject.amount = 0
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
end