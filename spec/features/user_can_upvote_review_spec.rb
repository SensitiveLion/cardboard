# require 'rails_helper'
# require 'helpers'
#
# feature 'user can vote on reviews' do
#   let(:user) { FactoryGirl.create(:user) }
#   scenario 'upvotes exist' do
#     sign_in_as(user)
#     review = FactoryGirl.create(:review)
#     game = review.game
#     visit game_path(game)
#     page.find("#up-#{review.id}")
#     within "#vote-#{review.id}" do
#       expect(page).to have_content("0")
#     end
#   end
#   scenario 'downvotes exist' do
#     sign_in_as(user)
#     review = FactoryGirl.create(:review)
#     game = review.game
#     visit game_path(game)
#     page.find("#down-#{review.id}")
#     within "#vote-#{review.id}" do
#       expect(page).to have_content("0")
#     end
#   end
#
#   pending 'user un-upvotes a review' do
#     sign_in_as(user)
#     visit game_path(review.game)
#     within '.vote-arrows' do
#       find(".fi-arrow-up").click
#       expect(page).to have_content("1")
#       find(".fi-arrow-up").click
#       expect(page).to have_content("0")
#     end
#   end
#
#   pending 'user downvotes a review' do
#     sign_in_as(user)
#     visit game_path(review.game)
#     within '.vote-arrows' do
#       find(".fi-arrow-down").click
#       expect(page).to have_content("-1")
#     end
#   end
#
#   pending 'user upvotes a review' do
#     sign_in_as(user)
#     visit game_path(review.game)
#     within '.vote-arrows' do
#       find(".fi-arrow-down").click
#       expect(page).to have_content("-1")
#       find(".fi-arrow-down").click
#       expect(page).to have_content("0")
#     end
#   end
#
#   pending 'user reverses a vote' do
#     sign_in_as(user)
#     visit game_path(review.game)
#     within '.vote-arrows' do
#       find(".fi-arrow-up").click
#       expect(page).to have_content("1")
#       find(".fi-arrow-down").click
#       expect(page).to have_content("-1")
#     end
#   end
# end
