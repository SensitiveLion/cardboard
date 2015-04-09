require 'coveralls'
Coveralls.wear!('rails')

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

def set_omniauth(opts = {})
  # default = {:provider => :facebook,
  #            :uuid     => "1234",
  #            :facebook => {
  #                           :email => "foobar@example.com",
  #                           :gender => "Male",
  #                           :first_name => "foo",
  #                           :last_name => "bar"
  #                         }
  #           }
  default = {"provider"=>"facebook",
 "uuid"=>"10102563568659741",
 "info"=>
  {"email"=>"matthew.s.riggott@gmail.com",
   "name"=>"Matthew Riggott",
   "first_name"=>"Matthew",
   "last_name"=>"Riggott",
   "image"=>"http://graph.facebook.com/10102563568659741/picture",
   "urls"=>{"Facebook"=>"https://www.facebook.com/app_scoped_user_id/10102563568659741/"},
   "verified"=>true},
 "credentials"=>
  {"token"=>
    "CAAUIIQcZBKB8BALgOQkeMpiXefOGQ6bXRLvXbiq6LIhoIqFUWpcqCDCnRKbgJJL5zpNiBkyZBscFQhtW2D171CZBTflqWxaA7qIqLT6trT6PlkvDZAWUMyjYG1P3qp8FGQFCGaRCa7KRbPAkIQY2dq0TJWz7a1qzfUiuwOoVUN8sZBpBsaYgQDi9w3Ys8EaPEe9JOfdPNw7vTBFdtUYLu",
   "expires_at"=>1433626419,
   "expires"=>true},
 "extra"=>
  {"raw_info"=>
    {"id"=>"10102563568659741",
     "email"=>"matthew.s.riggott@gmail.com",
     "first_name"=>"Matthew",
     "gender"=>"male",
     "last_name"=>"Riggott",
     "link"=>"https://www.facebook.com/app_scoped_user_id/10102563568659741/",
     "locale"=>"en_US",
     "name"=>"Matthew Riggott",
     "timezone"=>-4,
     "updated_time"=>"2015-03-26T05:36:32+0000",
     "verified"=>true}}}

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    'uid' => credentials[:uuid],
    "extra" => {
    "user_hash" => {
      "email" => user_hash[:email],
      "first_name" => user_hash[:first_name],
      "last_name" => user_hash[:last_name],
      username: "foobar",
      "gender" => user_hash[:gender]
      }
    }
  }
end

def set_invalid_omniauth(opts = {})

  credentials = { :provider => :facebook,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end
