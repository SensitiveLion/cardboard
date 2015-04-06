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

feature 'reviews paginate' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'reviews show on multiple pages' do
    sign_in_as(user)
    8.times { make_review_for_game(game) }
    visit game_path(game)
    click_link "review this game"
    fill_in "your review", with: "something something different"
    select 5, from: "rating"
    click_button "add review"
    visit game_path(game)
    expect(page).not_to have_content("something something different")
    click_link("Next")
    expect(page).to have_content("something something different")
  end
end
