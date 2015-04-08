require 'spec_helper'

describe UserSessionsController, "OmniAuth" do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "sets a session variable to the OmniAuth auth hash" do
    request.env["omniauth.auth"]['uid'].should == '123456789'
  end
end
