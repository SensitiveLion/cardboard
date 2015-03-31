require 'rails_helper'
require 'helpers'

feature 'user can edit games' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }


  scenario 'users can edit any game' do
    sign_in_as(user)
    visit game_path(game)
    click_link "edit game"
    fill_in 'name', with: 'wowgame'
    fill_in 'description', with: 'this game is great'
    fill_in 'minimum players', with: 2
    fill_in 'maximum players', with: 8
    fill_in 'playing time (min)', with: 50
    select 'medium', from: "complexity"
    click_button "edit game"
    expect(page).to have_content('wowgame')
    expect(page).to have_content("this game is great")
    expect(page).to have_content(2)
    expect(page).to have_content(8)
    expect(page).to have_content(50)
    expect(page).to have_content("medium")
  end
  let(:game) { FactoryGirl.create(:game) }

  scenario 'visitors can not edit any game' do
    visit game_path(game)
    click_link "edit game"
    expect(page).to have_content(
      'You need to sign in or sign up before continuing.'
    )
  end
end
