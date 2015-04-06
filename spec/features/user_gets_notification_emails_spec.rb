require 'rails_helper'
require 'helpers'

feature "Gets emails for new game reviews" do
  scenario "game user gets review emails" do
    ActionMailer::Base.deliveries.clear

    game = FactoryGirl.create(:game)
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit new_game_review_path(game)
    fill_in "your review", with: "Total garbage."
    click_button "add review"
    expect(page).to have_content("Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
