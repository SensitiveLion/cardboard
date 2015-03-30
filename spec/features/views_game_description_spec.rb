require 'rails_helper'


  feature 'user views the details of a game' do
    let(:game) { FactoryGirl.create(:game) }
    let(:game1) { FactoryGirl.create(:game1) }

    scenario 'user views game details' do
      sign_up
      game
      visit "/games"
      click_link "#{game.name}"
      expect(page).to have_content(game.name)
      expect(page).to have_content(game.description)
      expect(page).to have_content(game.min_players)
      expect(page).to have_content(game.max_players)
      expect(page).to have_content(game.playing_time)
      expect(page).to have_content(game.complexity)
    end

    scenario 'user doesnt view other games details' do
      sign_up
      game1
      game
      visit "/games"
      click_link "#{game.name}"
      expect(page).not_to have_content(game1.name)
      expect(page).not_to have_content(game1.description)
      expect(page).not_to have_content(game1.min_players)
      expect(page).not_to have_content(game1.max_players)
      expect(page).not_to have_content(game1.playing_time)
      expect(page).not_to have_content(game1.complexity)
    end

    scenario 'visitor views game details' do
      game
      visit "/games"
      click_link "#{game.name}"
      expect(page).to have_content(game.name)
      expect(page).to have_content(game.description)
      expect(page).to have_content(game.min_players)
      expect(page).to have_content(game.max_players)
      expect(page).to have_content(game.playing_time)
      expect(page).to have_content(game.complexity)
    end
  end


def sign_up
  visit new_user_registration_path

  fill_in 'Email', with: 'john@example.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'

  click_button 'Sign up'

  expect(page).to have_content('Welcome! You have signed up successfully.')
  expect(page).to have_content('Sign Out')
end
