require 'rails_helper'
require 'helpers'

feature 'user can edit reviews' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'users can edit their reviews' do
    sign_in_as(user)
    make_review_for_game(game)
    click_link "edit review"
    fill_in "your review", with: "something completely different"
    click_button "edit review"
    expect(page).to have_content("something completely different")
    expect(page).to have_content("you have successfully edited the review!")
  end

  scenario 'users can delete their reviews' do
    sign_in_as(user)
    make_review_for_game(game)
    click_link "edit review"
    click_button "delete this review"
    expect(page).not_to have_content("something something something")
  end
end
