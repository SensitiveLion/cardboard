require 'rails_helper'
require 'helpers'

feature 'user can edit their profile' do
  scenario 'successful edit' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_link(user.username)
    fill_in 'username', with: "DifferentUser"
    fill_in 'current password', with: user.password
    click_button "update"
    expect(page).to have_content("DifferentUser")
  end
end

feature 'user can delete their profile' do
  scenario 'successful delete' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_link(user.username)
    fill_in 'current password', with: user.password
    click_button "cancel my account"
    expect(page).to have_content("Sign In")
  end
end
