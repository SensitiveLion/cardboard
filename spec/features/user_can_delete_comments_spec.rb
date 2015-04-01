require 'rails_helper'
require 'helpers'

feature 'only posting user can delete a comment' do
  let(:user) { FactoryGirl.create(:user) }
  let(:game) { FactoryGirl.create(:game) }

  scenario 'user can delete their comment' do
    sign_in_as(user)
    visit game_path(game)
    add_review
    add_comment
    click_button "delete"
    expect(page).to have_content("comment deleted")
  end
end
