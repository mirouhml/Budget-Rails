require 'rails_helper'

RSpec.describe "Categories", type: :feature do
  
  before(:each) do
    User.create(name: 'John', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  it 'should show the categories index page' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'should show no categories' do
    expect(page).to have_content('No categories yet')
  end

  it 'should logout' do
    click_button 'LOGOUT'
    expect(page).to have_content('Budget Rails')
  end

  it 'should show the new category page' do
    click_link 'Add a new category'
    expect(page).to have_content('ADD CATEGORY')
  end

  it 'should create a new category' do
    click_link 'Add a new category'
    fill_in 'Category name', with: 'Category 1'
    fill_in 'Icon', with: 'Icon link'
    click_button 'Save'
    expect(page).to have_content('Category 1')
  end

  it 'should show the transaction page for the category' do
    click_link 'Add a new category'
    fill_in 'Category name', with: 'Category 1'
    fill_in 'Icon', with: 'Icon link'
    click_button 'Save'
    click_link 'Category 1'
    expect(page).to have_content('CATEGORY 1')
  end

  it 'should show no transactions in the transaction page of the category' do
    click_link 'Add a new category'
    fill_in 'Category name', with: 'Category 1'
    fill_in 'Icon', with: 'Icon link'
    click_button 'Save'
    click_link 'Category 1'
    expect(page).to have_content('No transactions yet')
  end

  it 'should show the new transaction page for the category' do
    click_link 'Add a new category'
    fill_in 'Category name', with: 'Category 1'
    fill_in 'Icon', with: 'Icon link'
    click_button 'Save'
    click_link 'Category 1'
    click_link 'Add a new transaction'
    expect(page).to have_content('ADD TRANSACTION')
  end

  it 'should create a new transaction with the correct information' do
    click_link 'Add a new category'
    fill_in 'Category name', with: 'Category 1'
    fill_in 'Icon', with: 'Icon link'
    click_button 'Save'
    click_link 'Category 1'
    click_link 'Add a new transaction'
    fill_in 'Transaction name', with: 'Transaction 1'
    fill_in 'Amount', with: '100'
    click_button 'Save'
    expect(page).to have_content('Transaction 1')
    expect(page).to have_content('100')
  end

  it 'should show the correct total in the transaction page of the category' do
    click_link 'Add a new category'
    fill_in 'Category name', with: 'Category 1'
    fill_in 'Icon', with: 'Icon link'
    click_button 'Save'
    click_link 'Category 1'
    click_link 'Add a new transaction'
    fill_in 'Transaction name', with: 'Transaction 1'
    fill_in 'Amount', with: '100'
    click_button 'Save'
    click_link 'Add a new transaction'
    fill_in 'Transaction name', with: 'Transaction 2'
    fill_in 'Amount', with: '200'
    click_button 'Save'
    expect(page).to have_content('200')
  end
end
