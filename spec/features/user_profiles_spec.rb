require 'rails_helper'
require 'helpers'

feature 'user can view profile' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'users can view their profile' do
    sign_in_as(user)
    make_review_for_game(game)
    visit users_path
    within(".column") do
      click_link user.username
    end
    expect(page).to have_content(user.username)
    expect(page).to have_content("review of #{game.name}")
  end

  scenario 'visitors can view profiles' do
    sign_in_as(user)
    make_review_for_game(game)
    click_link "Sign Out"
    visit users_path
    within(".column") do
      click_link user.username
    end
    expect(page).to have_content(user.username)
    expect(page).to have_content("review of #{game.name}")
  end
end
