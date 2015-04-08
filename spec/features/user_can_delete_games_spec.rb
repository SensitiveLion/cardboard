require 'rails_helper'

feature 'only admin or users can delete a game' do
  let(:game) { FactoryGirl.create(:game) }
  scenario 'user can delete game' do
    sign_up
    visit new_game_path
    fill_in 'name', with: 'wowgame'
    fill_in 'description', with: "Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu."
    fill_in 'minimum players', with: 2
    fill_in 'maximum players', with: 8
    fill_in 'playing time (min)', with: 50
    select "medium", from: "complexity"
    click_button "add game"
    click_link "edit game"
    click_link "delete this game"
    expect(page).to have_content("Game deleted.")
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
