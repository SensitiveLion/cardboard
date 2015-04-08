require 'rails_helper'
require 'helpers'

feature "Gets emails for new game reviews" do
  scenario "game user gets review emails" do
    ActionMailer::Base.deliveries.clear

    game = FactoryGirl.create(:game)
    user = FactoryGirl.create(:user)

    sign_in_as(user)
    visit new_game_review_path(game)
    fill_in "your review", with: "Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu. Total garbage."
    click_button "add review"
    expect(page).to have_content("Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
