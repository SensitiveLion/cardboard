require 'rails_helper'



feature 'views games' do
  let(:game) { FactoryGirl.create(:game) }
  let(:game1) { FactoryGirl.create(:game1) }

  scenario 'user sees game list' do
    game
    game1
    visit '/games'
    expect(page).to have_content(game.name)
    expect(page).to have_content(game1.name)
  end
end
