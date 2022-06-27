require 'rails_helper'

describe User, type: :model do
  subject do
    User.new(name: 'John Doe', email: 'john@something.com', password: '123456', confirmed_at: Time.now)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
