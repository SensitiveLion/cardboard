require 'rails_helper'
require 'helpers'

feature 'user can search for games' do
  let(:game) { FactoryGirl.create(:game) }
  let(:game1) { FactoryGirl.create(:game) }
  scenario 'user can search for games' do
    visit games_path
    fill_in :query, with: game.name
    click_button "search"
    expect(page).to have_content(game.name)
    expect(page).not_to have_content(game1.name)
  end
end
