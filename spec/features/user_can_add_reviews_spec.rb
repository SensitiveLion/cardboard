require 'rails_helper'
require 'helpers'

feature 'user can add new reviews' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user can add reviews to any game' do
    sign_in_as(user)
    make_review_for_game(game)
    expect(page).to have_content("review submitted.")
  end

  scenario 'visitor cannot add reviews' do
    visit new_game_review_path(game)
    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
  end
end
