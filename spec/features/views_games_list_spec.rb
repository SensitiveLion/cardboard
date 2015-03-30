require 'rails_helper'

feature 'views games' do
  let(:game) { FactoryGirl.create(:game) }

  scenario 'user sees game list' do
    game
    visit '/games'
    expect(page).to have_content(game.name)
  end
end
