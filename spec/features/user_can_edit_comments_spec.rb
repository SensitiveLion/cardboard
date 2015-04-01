require 'rails_helper'
require 'helpers'

feature 'user can edit comments' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user can edit their comments' do
    sign_in_as(user)
    visit game_path(game)
    add_review
    add_comment
    click_link "edit"
    fill_in "your comment", with: "something something else"
    click_button "edit comment"
    expect(page).to have_content("something something else")
  end
end
