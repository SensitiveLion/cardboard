require 'coveralls'
Coveralls.wear!('rails')

RACK_ENV = ENV['ENVIRONMENT'] ||= 'test'

def valid_facebook_login
  if RACK_ENV == 'test'
    OmniAuth.config.test_mode = true
    fb_omniauth_hash =
        {"provider"=>"facebook",
     "uid"=>"123456789",
     "info"=>
      {"email"=>"bob@gmail.com",
       "name"=>"Bob Smith",
       "first_name"=>"Bob",
       "last_name"=>"Smith",
       "verified"=>true},
     "credentials"=>
      {"token"=>
        "testingtoken91584hkdhf3",
        "expires_at"=>(Time.now + 1.week)},
     "extra"=>
      {"raw_info"=>
        {"id"=>"04296802934096",
         "email"=>"bob@gmail.com",
         "first_name"=>"Bob",
         "gender"=>"male",
         "last_name"=>"Smith",
         "locale"=>"en_US",
         "name"=>"Bob Smith",
         "timezone"=>-4,
         "updated_time"=>"2015-03-26T05:36:32+0000",
         "verified"=>true}}}
  end
end

OmniAuth.config.add_mock(:facebook, fb_omniauth_hash)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before :each do
    ActionMailer::Base.deliveries.clear
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
