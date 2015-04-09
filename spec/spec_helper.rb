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
  default = {provider: :facebook,
             uuid:        "1234",
             facebook:  {
                          email: "foobar@example.com",
                          gender: "Male",
                          first_name: "foo",
                          last_name: "bar"
                        }
            }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    uid: credentials[:uuid],
    extra: {
    user_hash: {
      email: user_hash[:email],
      first_name: user_hash[:first_name],
      last_name: user_hash[:last_name],
      username: "foobar",
      gender: user_hash[:gender]
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
