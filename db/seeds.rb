

if Rails.env.development?
  Game.find_or_create_by(name: "its a game",
  description: "for srs. totlly a game", min_players: 1, max_players: 9001,
   playing_time: "42 mins", complexity: "low")

   User.find_or_create_by(username: "hi", first_name: "kayla", age: "25",
   location: "boston", avatar_url: "www.thing.google.com/images",
   email: "hi@example.com", encrypted_password: "password"  )
end
