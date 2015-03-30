

if Rails.env.development?
  Game.find_or_create_by(name: "its a game",
  description: "for srs. totlly a game", min_players: 1, max_players: 9001,
   playing_time: "42 mins", complexity: "low")
end
