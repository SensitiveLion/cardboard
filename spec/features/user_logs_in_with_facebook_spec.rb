require 'spec_helper'
require 'rails_helper'

describe "user logs in facebook" do

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:facebook, {
    uid: "1234",
    provider: "facebook",
    extra: {
      raw_info: {
        id: "99999",
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

  scenario "User logs in with their facebook account" do
    visit '/'
    visit new_user_registration_path
    expect(page).to have_content("Sign in with Facebook")
    click_link "Sign in with Facebook"
    expect(page).to have_content("foobar999")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content("Successfully authenticated from Facebook account.")
  end

end
