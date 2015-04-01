require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to register
  So that I can create an account
} do


  scenario 'provide valid registration information' do
    visit new_user_registration_path

    fill_in 'username', with: 'hi'
    fill_in 'email', with: 'john@example.com'
    fill_in 'password', with: 'password'
    fill_in 'confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end

  scenario 'provide invalid registration information' do
    visit new_user_registration_path

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end
end
