
if Rails.env.development?
  user = User.find_or_create_by!(
    username: "hi",
    first_name: "kayla",
    age: "25",
    location: "boston",
    profile_photo: "www.thing.google.com/images",
    email: "hi@example.com",
    encrypted_password: "password3"
  )

  game = Game.find_or_create_by!(
    user: user,
    name: "its a game",
    description: "for srs. totlly a game",
    min_players: 1,
    max_players: 9001,
    playing_time: 42,
    complexity: 1
  )

  Review.find_or_create_by!(
  user: user,
  game: game,
  body: "testing votes"
  )
end
