require 'rails_helper'
require 'helpers'

feature 'user has xp' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user page displays xp' do
    sign_in_as(user)
    visit user_path(user)
    within(".title") do
      expect(page).to have_content(user.karma_score)
    end
  end
end
