require 'rails_helper'
require 'helpers'

feature 'user can vote on reviews' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }
  let(:review) {FactoryGirl.create(:review) }

  scenario 'user upvotes a review' do
    sign_in_as(user)
    visit game_path(review.game)
    within ".vote-arrows" do
      find(".upvote").click
    end
    save_and_open_page
    within '.vote-count' do
      expect(page).to have_content("1")
    end
  end

  scenario 'user un-upvotes a review' do
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

  scenario 'user downvotes a review' do
    sign_in_as(user)
    visit game_path(review.game)
    within '.vote-arrows' do
      find(".fi-arrow-down").click
      expect(page).to have_content("-1")
    end
  end

  scenario 'user upvotes a review' do
    sign_in_as(user)
    visit game_path(review.game)
    within '.vote-arrows' do
      find(".fi-arrow-down").click
      expect(page).to have_content("-1")
      find(".fi-arrow-down").click
      expect(page).to have_content("0")
    end
  end

  scenario 'user reverses a vote' do
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

