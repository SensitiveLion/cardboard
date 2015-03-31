require 'rails_helper'

feature 'user adds new reviews' do
  let(:game) { FactoryGirl.create(:game) }
  pending 'user can add reviews to games' do
    sign_up
    visit game_path(game)
    fill_in 'name', with: 'wowgame'
    fill_in 'description', with: 'this game is great'
    fill_in 'minimum players', with: 2
    fill_in 'maximum players', with: 8
    fill_in 'playing time (min)', with: 50
    select "medium", :from => "complexity"
    click_button "add game"

    expect(page).to have_content('you have added a new game')
    expect(page).to have_content("wowgame")
  end
end
