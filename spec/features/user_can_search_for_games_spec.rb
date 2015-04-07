require 'rails_helper'
require 'helpers'

feature 'user can search for games' do
  let(:game) { FactoryGirl.create(:game) }
  let(:game1) { FactoryGirl.create(:game) }
  scenario 'user finds games' do
    visit games_path
    fill_in :query, with: game.name
    click_button "search"
    expect(page).to have_content(game.name)
    expect(page).not_to have_content(game1.name)
  end

  scenario "user can searches for game that doesn't exist" do
    visit games_path
    fill_in :query, with: "frank"
    click_button "search"
    expect(page).not_to have_content(game.name)
    expect(page).to have_content("No games matched your search")
  end
end
