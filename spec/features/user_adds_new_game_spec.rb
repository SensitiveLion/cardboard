require 'rails_helper'

feature 'user adds new game' do
  scenario 'user adds new game' do
    sign_up
    visit new_game_path
    fill_in 'name', with: 'wowgame'
    fill_in 'description', with: "Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu."
    fill_in 'minimum players', with: 2
    fill_in 'maximum players', with: 8
    fill_in 'playing time (min)', with: 50
    select "medium", :from => "complexity"
    click_button "add game"

    expect(page).to have_content('you have added a new game')
    expect(page).to have_content("wowgame")
  end

  scenario 'visitors cannot add a new game' do
    visit new_game_path
    expect(page).to have_content(
      'You need to sign in or sign up before continuing.'
    )
  end

  scenario "name, description, min/max players, game length can't be blank" do
    sign_up
    visit new_game_path
    click_button "add game"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Min players can't be blank")
    expect(page).to have_content("Max players can't be blank")
    expect(page).to have_content("Playing time can't be blank")
  end
end
