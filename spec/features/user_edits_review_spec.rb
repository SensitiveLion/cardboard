require 'rails_helper'
require 'helpers'

feature 'user can edit reviews' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'users can edit their reviews' do
    sign_in_as(user)
    review(game)
    click_button "edit review"
    fill_in "your review", with: "something completely different"
    expect(page).to have_content("something completely different")
  end

  scenario 'users can delete their reviews' do
    sign_in_as(user)
    review(game)
    click_button "edit review"
    click_button "delete this review"
    expect(page).not_to have_content("something something something")
  end
end
