require 'rails_helper'
require 'helpers'

feature 'user has level status' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user page displays user status' do
    sign_in_as(user)
    visit user_path(user)
    within(".title") do
      expect(page).to have_content(user.status)
    end
  end
end
