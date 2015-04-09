require 'rails_helper'
require 'helpers'

feature 'user can view index of users' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'users can view index of users' do
    sign_in_as(user)
    visit users_path
    within(".column") do
      expect(page).to have_content(user.username)
    end
  end

  scenario 'visitors can view index of users' do
    sign_in_as(user)
    click_link 'sign out'
    visit users_path
    within(".column") do
      expect(page).to have_content(user.username)
    end
  end
end

feature 'user can view profile' do
  let(:review) { FactoryGirl.create(:review, user: user) }
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user can navigate to their own profile from the users index page' do
    sign_in_as(user)
    visit users_path
    within(".column") do
      click_link user.username
    end
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.age)
    expect(page).to have_content(user.location)
  end

  scenario 'visitor can navigate to profiles from the users index page' do
    sign_in_as(user)
    click_link 'sign out'
    visit users_path
    within(".column") do
      click_link user.username
    end
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.age)
    expect(page).to have_content(user.location)
  end
end
