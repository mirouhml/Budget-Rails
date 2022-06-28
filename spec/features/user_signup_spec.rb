require 'rails_helper'

RSpec.describe 'User Signup', type: :feature do
  it 'should redirect to splash page because the user did not confirm their email' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Full name', with: 'John'
    fill_in 'Email', with: 'john@something.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Budget Rails')
  end
end
