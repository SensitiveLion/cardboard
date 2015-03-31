require 'rails_helper'
require 'helpers'

feature 'only admin or users can delete a game' do
  let(:user) { FactoryGirl.create(:user) }
  scenario 'game user can delete game' do
    sign_in_as(user)
    game = create_game(user)
    visit game_path(game)
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
  fill_in 'username', with: 'im as user'

  click_button 'Sign up'
end
