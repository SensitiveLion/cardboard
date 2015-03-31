require 'rails_helper'

feature 'only admin or users can delete a game' do
  let(:game) { FactoryGirl.create(:game) }
  scenario 'game user can delete game' do
    game_user
    click_link "edit game"
    click_button "delete this game"
    expect(page).to have_content("Game deleted.")
  end
end

def game_user
  visit new_user_registration_path
  fill_in 'email', with: 'john@example.com'
  fill_in 'password', with: 'password'
  fill_in 'confirmation', with: 'password'
  fill_in 'username', with: 'im a user'

  click_button 'Sign up'
  expect(page).to have_content('Welcome! You have signed up successfully.')
  visit new_game_path
  fill_in 'name', with: 'wowgame'
  fill_in 'description', with: 'this game is great'
  fill_in 'minimum players', with: 2
  fill_in 'maximum players', with: 8
  fill_in 'playing time (min)', with: 50
  select "medium", from: "complexity"
  click_button "add game"
end
