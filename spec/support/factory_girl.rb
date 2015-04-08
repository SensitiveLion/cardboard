require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name "person"
    last_name "personson"
    age "20"
    location "here"
    password 'password'
    password_confirmation 'password'
  end

  factory :game do
    sequence(:name) { |n| "This is a game #{n}" }
    sequence(:description) { |n| "Butcher McSweeney's High Life, PBR&B +1
      single-origin coffee 8-bit stumptown distillery messenger bag XOXO
      Vice meditation tilde. Chia fashion axe flannel pickled biodiesel
      retro four dollar toast tote bag art party, keffiyeh mustache artisan
      mumblecore tofu. Description #{n}" }
    min_players 1
    max_players 4
    playing_time 20
    complexity "Low"
    user
  end

  factory :review do
    body "Butcher McSweeney's High Life, PBR&B +1 single-origin coffee
      8-bit stumptown distillery messenger bag XOXO Vice meditation tilde.
      Chia fashion axe flannel pickled biodiesel retro four dollar toast
      tote bag art party, keffiyeh mustache artisan mumblecore tofu."
    game_rating 1
    game
    user
  end

  factory :comment do
    body "its a comment@!"
    review
    user
  end
end
