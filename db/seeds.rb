
if Rails.env.development?
  User.find_or_create_by(
    id: 1, username: "hi",
    first_name: "kayla",
    age: "25",
    location: "boston",
    avatar_url: "www.thing.google.com/images",
    email: "hi@example.com",
    encrypted_password: "password"
  )

  Game.find_or_create_by(
    user_id: 1,
    name: "its a game",
    description: "for srs. totlly a game",
    min_players: 1,
    max_players: 9001,
    playing_time: "42 mins",
    complexity: "low"
  )
end
