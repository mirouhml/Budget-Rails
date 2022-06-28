require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  before(:each) do
    User.create(name: 'John', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
  end

  it 'should login correctly' do
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content('CATEGORIES')
  end

  it 'should not login because of wrong email or password' do
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'wrong_password'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end
end
