require 'rails_helper'
require 'helpers'

feature 'games display average' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'games show review averages' do
    sign_in_as(user)
    make_review_for_game(game)
    make_review_for_game1(game)
  end

  scenario 'game with no reviews shows nothing' do
    sign_in_as(user)
    visit game_path(game)
    expect(page).not_to have_content(game.average)
  end
end
