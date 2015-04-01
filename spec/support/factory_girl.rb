require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
FactoryGirl.define do
  factory :game do
    sequence(:name) { |n| "This is a game #{n}" }
    sequence(:description) { |n| "Description #{n}" }
    min_players 1
    max_players 4
    playing_time "20 min"
    complexity "Low"

    user
  end
end

FactoryGirl.define do
  factory :review do
    body "this is a review"

    game
    user
  end
end

FactoryGirl.define do
  factory :comment do
    body "its a comment@!"

    review
    user
  end
end
