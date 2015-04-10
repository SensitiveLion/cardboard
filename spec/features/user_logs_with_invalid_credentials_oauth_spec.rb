require 'spec_helper'
require 'rails_helper'

describe "user oauths in with invalid credentials" do

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = nil
    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end

  scenario "User logs in with their invalid facebook account " do
    visit '/'
    click_link 'sign up'
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    click_link "sign in with Facebook"
    expect(page).to have_content("sign in with Facebook")
    expect(page).to have_content("sign up")
    expect(page).to have_content('Could not authenticate you from Facebook because "Invalid credentials".')
  end

  scenario "User logs in with their invalid facebook account " do
    visit '/'
    click_link 'sign up'
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    click_link "sign in with Google Oauth2"
    expect(page).to have_content("sign in with Google Oauth2")
    expect(page).to have_content("sign up")
    expect(page).to have_content('Could not authenticate you from GoogleOauth2 because "Invalid credentials".')
  end

end
