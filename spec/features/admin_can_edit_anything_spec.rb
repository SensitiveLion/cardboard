require 'rails_helper'
require 'helpers'

feature 'admin can delete or edit any game, review, or comment' do
  let(:game) { FactoryGirl.create(:game) }
  let(:admin) { FactoryGirl.create(:user, authority: "admin") }
  let(:review) { FactoryGirl.create(:review) }
  let(:comment) { FactoryGirl.create(:comment) }

  scenario 'admin can delete a game' do
    sign_in_as(admin)
    visit game_path(game)
    click_link "edit game"
    click_button "delete this game"
    expect(page).to have_content("Game deleted.")
  end

  scenario 'admin can edit a review' do
    sign_in_as(admin)
    visit game_path(review.game)
    click_link "edit review"
    fill_in "your review", with: "something completely different"
    click_button "edit review"
    expect(page).to have_content("something completely different")
    expect(page).to have_content("you have successfully edited the review!")
  end

  scenario 'admin can delete a review' do
    sign_in_as(admin)
    visit game_path(review.game)
    click_link "edit review"
    click_button "delete this review"
    expect(page).not_to have_content("something something something")
  end

  scenario 'admin can edit a comment' do
    sign_in_as(admin)
    visit game_path(comment.review.game)
    click_link "edit"
    fill_in "your comment", with: "something something else"
    click_button "edit comment"
    expect(page).to have_content("something something else")
  end

  scenario 'admin can delete a comment' do
    sign_in_as(admin)
    visit game_path(comment.review.game)
    click_link "delete"
    expect(page).not_to have_content("something comment something")
    expect(page).to have_content("comment deleted")
  end
end
