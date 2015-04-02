require 'rails_helper'
require 'helpers'

feature 'user can add comments to reviews' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user can add comments to a review' do
    sign_in_as(user)
    visit game_path(game)
    add_review
    click_link "add comment"
    fill_in "your comment", with: "something something something"
    click_button "add comment"
    expect(page).to have_content("comment submitted.")
  end
  scenario 'visitor cannot add comments' do
    visit new_game_review_path(game)
    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
  end

  scenario 'user can add comments to a review' do
    sign_in_as(user)
    visit game_path(game)
    add_review
    click_link "add comment"
    fill_in "your comment", with: "something to be cancelled"
    click_button "cancel"
    expect(page).to have_content(game.name)
    expect(page).not_to have_content("something to be cancelled")
  end

end
