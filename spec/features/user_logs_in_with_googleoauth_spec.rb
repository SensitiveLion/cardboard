require 'spec_helper'
require 'rails_helper'
require 'helpers'
describe "user logs in google" do

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:google_oauth2, {
    uid: "1234",
    provider: "google",
    extra: {
      raw_info: {
        sub: "99999",
        locale: "US"
      }
    },
    info: {
      email: "foobar@example.com",
      first_name: "foo",
      last_name: "bar",
      username: "foobar",
      gender: "Male",
      verified: "true"
    }
  })
  end

  scenario "User logs in with their google acount" do
    visit '/'
    visit new_user_registration_path
    expect(page).to have_content("Sign in with Google")
    click_link "Sign in with Google"
    expect(page).to have_content("foobar999")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("Successfully authenticated from Google_oauth2 account.")
  end

end
