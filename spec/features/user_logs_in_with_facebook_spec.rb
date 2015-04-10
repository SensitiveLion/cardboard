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
    click_link 'sign up'
    click_link "sign in with Facebook"
    expect(page).to have_content("foobar999")
    expect(page).to have_content("sign out")
    expect(page).to have_content("Successfully authenticated from Facebook account.")
  end

end
