require 'rails_helper'
require 'helpers'

feature 'user can vote on reviews' do
  let(:user) { FactoryGirl.create(:user) }
  let(:game) {FactoryGirl.create(:game) }

  scenario 'upvotes and downvotes exist' do
    sign_in_as(user)
    make_review_for_game(game)
    new_review = Review.find_by(body: "something something something")
    page.find("#up-#{new_review.id}").click
    within "#vote_#{new_review.id}" do
      expect(page).to have_content("1")
    end
  end

  pending 'user un-upvotes a review' do
    sign_in_as(user)
    visit game_path(review.game)
    within '.vote-arrows' do
      find(".fi-arrow-up").click
      save_and_open_page
      expect(page).to have_content("1")
      find(".fi-arrow-up").click
      expect(page).to have_content("0")
    end
  end

  pending 'user downvotes a review' do
    sign_in_as(user)
    visit game_path(review.game)
    within '.vote-arrows' do
      find(".fi-arrow-down").click
      expect(page).to have_content("-1")
    end
  end

  pending 'user upvotes a review' do
    sign_in_as(user)
    visit game_path(review.game)
    within '.vote-arrows' do
      find(".fi-arrow-down").click
      expect(page).to have_content("-1")
      find(".fi-arrow-down").click
      expect(page).to have_content("0")
    end
  end

  pending 'user reverses a vote' do
    sign_in_as(user)
    visit game_path(review.game)
    within '.vote-arrows' do
      find(".fi-arrow-up").click
      expect(page).to have_content("1")
      find(".fi-arrow-down").click
      expect(page).to have_content("-1")
    end
  end
end
