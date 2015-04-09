require 'spec_helper'
require 'rails_helper'
require 'helpers'
describe "user logs in facebook" do

  before do
    request.env["devise.mapping"] = Devise.mappings[:user] # If using Devise
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario "sets a session variable to the OmniAuth auth hash" do
    visit '/'
    visit new_user_registration_path
    expect(page).to have_content("Sign in with Facebook")
    mock_fb
    binding.pry
    click_link "Sign in with Facebook"
    save_and_open_page
    expect(page).to have_content("mockuser")
    expect(page).to have_content("Sign out")
  end

end
