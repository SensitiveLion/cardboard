require 'rails_helper'


feature 'user can edit games' do
  let(:game) { FactoryGirl.create(:game) }

  scenario 'users can edit any game' do
    sign_up
    game
    visit "/games/#{game.id}"
    click_link "edit game"
    fill_in 'name', with: 'wowgame'
    fill_in 'description', with: 'this game is great'
    fill_in 'minimum players', with: 2
    fill_in 'maximum players', with: 8
    fill_in 'playing time (min)', with: 50
    select 'medium', :from => "complexity"
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
    game
    visit "/games/#{game.id}"
    click_link "edit game"
    expect(page).to have_content(
      'You need to sign in or sign up before continuing.'
    )
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
