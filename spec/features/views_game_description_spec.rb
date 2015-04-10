require 'rails_helper'

feature 'site visitor views the details of a game' do
  let(:game) { FactoryGirl.create(:game) }
  scenario 'visitor views game details' do
    game
    visit homes_path
    click_link game.name
    expect(page).to have_content(game.name)
    expect(page).to have_content(game.description)
    expect(page).to have_content(game.min_players)
    expect(page).to have_content(game.max_players)
    expect(page).to have_content(game.playing_time)
    expect(page).to have_content(game.complexity)
  end
end
