require 'rails_helper'

describe Category, type: :model do
  subject do
    user = User.create(name: 'John Doe', email: 'john@something.com', password: '123456', confirmed_at: Time.now)
    Category.new(name: 'Category 1', icon: 'Icon 1', author: user)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
end
