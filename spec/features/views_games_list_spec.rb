require 'rails_helper'

feature 'views games' do
  let(:game) { FactoryGirl.create(:game) }

  scenario 'visitor sees game list' do
    game
    visit games_path
    expect(page).to have_content(game.name)
  end
end


