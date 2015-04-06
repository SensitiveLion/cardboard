require 'rails_helper'
require 'helpers'

feature 'reviews show votes' do
  let(:game) { FactoryGirl.create(:game) }
  let(:user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.create(:review) }

  scenario 'new reviews show zero votes' do
    visit game_path(game)
    expect(page).to have_content(review.vote_count)
  end
end
