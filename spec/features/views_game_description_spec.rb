require 'rails_helper'

  feature 'user views the details of a game' do
    let(:game) { FactoryGirl.create(:game) }
    let(:game1) { FactoryGirl.create(:game1) }

    scenario 'user views game details' do
      sign_up
      game
      visit "/games"
      click_link game.name
      expect(page).to have_content(game.name)
      expect(page).to have_content(game.description)
      expect(page).to have_content(game.min_players)
      expect(page).to have_content(game.max_players)
      expect(page).to have_content(game.playing_time)
      expect(page).to have_content(game.complexity)
    end

    scenario 'visitor views game details' do
      game
      visit "/games"
      click_link game.name
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

    fill_in 'email', with: 'john@example.com'
    fill_in 'password', with: 'password'
    fill_in 'confirmation', with: 'password'
    fill_in 'username', with: 'im a user'

    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end
