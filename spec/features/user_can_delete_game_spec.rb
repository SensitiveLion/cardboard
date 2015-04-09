require 'rails_helper'
require 'helpers'

feature 'only admin or users can delete a game' do
  let(:user) { FactoryGirl.create(:user) }
  scenario 'game user can delete game' do
    sign_in_as(user)
    game = create_game(user)
    visit game_path(game)
    click_link "edit game"
    click_link "delete this game"
    expect(page).to have_content("game deleted.")
  end
end
