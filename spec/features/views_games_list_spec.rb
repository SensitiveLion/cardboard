require 'rails_helper'



feature 'user views restaurants' do
  let(:game) { FactoryGirl.create(:game) }
  let(:game1) { FactoryGirl.create(:game1) }

  scenario 'user sees game list' do
    sign_up
    game
    game1
    visit '/games'
    expect(page).to have_content(game.name)
    expect(page).to have_content(game1.name)
  end
  scenario 'visitor sees game list' do
    game
    game1
    visit '/games'
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Sign In")
    expect(page).to have_content(game.name)
    expect(page).to have_content(game1.name)
  end
end


def sign_up
  visit new_user_registration_path

  fill_in 'Email', with: 'john@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'

  click_button 'Sign up'

  expect(page).to have_content('Welcome! You have signed up successfully.')
  expect(page).to have_content('Sign Out')
end
