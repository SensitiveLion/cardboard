require 'rails_helper'
require 'helpers'

feature 'admin can delete or edit any game, review, or comment' do
  let(:game) { FactoryGirl.create(:game) }
  let(:admin) { FactoryGirl.create(:user, authority: "admin") }
  let(:review) { FactoryGirl.create(:review) }
  let(:comment) { FactoryGirl.create(:comment) }
  let(:user) { FactoryGirl.create(:user, authority: "user") }
  let(:mod) { FactoryGirl.create(:user, authority: "mod") }

  scenario 'admin can delete a game' do
    sign_in_as(admin)
    visit game_path(game)
    click_link "edit game"
    click_link "delete this game"
    expect(page).to have_content("Game deleted.")
  end

  scenario 'admin can edit a review' do
    sign_in_as(admin)
    visit game_path(review.game)
    click_link "edit review"
    fill_in "your review", with: "Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu. something completely different"
    click_button "edit review"
    expect(page).to have_content("something completely different")
    expect(page).to have_content("you have successfully edited the review!")
  end

  scenario 'admin can delete a review' do
    sign_in_as(admin)
    visit game_path(review.game)
    click_link "edit review"
    click_link "delete this review"
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

  scenario 'admin can make user a mod' do
    sign_in_as(admin)
    visit user_path(user)
    click_link "make this user a mod"
    expect(page).to have_content("revoke modship")
  end

  scenario 'admin can revoke modship' do
    sign_in_as(admin)
    visit user_path(mod)
    click_link "revoke modship"
    expect(page).to have_content("make this user a mod")
  end
end
