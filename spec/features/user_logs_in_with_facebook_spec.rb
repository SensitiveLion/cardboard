require 'spec_helper'
require 'rails_helper'
feature "user logs in facebook" do

  scenario "sets a session variable to the OmniAuth auth hash" do
    set_omniauth()
    visit new_user_registration_path
    save_and_open_page
    click_link 'Sign in with Facebook'
  end

end
