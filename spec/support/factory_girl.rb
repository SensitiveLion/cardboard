require 'factory_girl'

FactoryGirl.define do
  factory :game do
    name "this is a game"
    description "cards and stuff"
    min_players 1
    max_players 2
    playing_time "20 min"
    complexity "Low"
      factory :game1 do
        name "this is also a game"
        description "boards and stuff"
        min_players 2
        max_players 4
        playing_time "60 min"
        complexity "Medium"
      end
    end
  end

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user#{n}"}
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end
end
