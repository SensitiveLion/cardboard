require 'rails_helper'

feature 'user adds new game' do
  scenario 'user adds new game' do
    sign_up
    visit "/games/new"
    fill_in 'name', with: 'wowgame'
    fill_in 'description', with: 'this game is great'
    fill_in 'minimum players', with: 8
    fill_in 'maximum players', with: 2
    fill_in 'playing time (min)', with: 50
    select "medium", :from => "complexity"
    click_button "add game"

    expect(page).to have_content('you have added a new game')
    expect(page).to have_content("wowgame")
  end

  scenario "game details can't be blank" do

    visit "/games/new"
    click_button "add game"
    expect(page).to have_content("Playing time can't be blank")
  end
end

def sign_up
  visit new_user_registration_path
  fill_in 'email', with: 'john@example.com'
  fill_in 'password', with: 'password'
  fill_in 'confirmation', with: 'password'
  fill_in 'username', with: 'im a user'

  click_button 'Sign up'

  expect(page).to have_content('Welcome! You have signed up successfully.')
  expect(page).to have_content('Sign Out')
end
