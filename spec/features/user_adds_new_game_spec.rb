require 'rails_helper'

feature 'user adds new game' do
  scenario 'user adds new game' do
    sign_up
    visit "/games/new"
    fill_in 'name', with: 'wowgame'
    fill_in 'description', with: 'this game is great'
    fill_in 'minimum players', with: 8
    fill_in 'maximum players', with: 2
    fill_in 'playing time (min)', with: 5012
    click_button "add game"

    expect(page).to have_content('you have added a new game')
    expect(page).to have_content(game.name)

  end

  scenario 'visitor can not add a new game' do
    visit "/games/new"
    fill_in 'name', with: 'wowgame'
    fill_in 'description', with: 'this game is great'
    fill_in 'minimum players', with: 8
    fill_in 'maximum players', with: 2
    fill_in 'playing time (min)', with: 5012
    click_button "add game"

    expect(page).to have_content('game not added!')
    expect(page).not_to have_content(game.name)

  end
end

def sign_up
  visit new_user_registration_path
  fill_in 'email', with: 'john@example.com'
  fill_in 'password', with: 'password'
  fill_in 'password confirmation', with: 'password'
  fill_in 'username', with: 'im a user'

  click_button 'Sign up'

  expect(page).to have_content('Welcome! You have signed up successfully.')
  expect(page).to have_content('Sign Out')
end
