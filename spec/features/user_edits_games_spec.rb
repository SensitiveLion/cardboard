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
    fill_in 'description', with: "Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu."
    fill_in 'minimum players', with: 2
    fill_in 'maximum players', with: 8
    fill_in 'playing time (min)', with: 50
    select 'medium', from: "complexity"
    click_button "edit game"
    expect(page).to have_content('wowgame')
    expect(page).to have_content("Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu.")
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
