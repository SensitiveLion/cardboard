class Game < ActiveRecord::Base

  validates_presence_of :name, uniqueness: true
  validates_presence_of :description
  validates_presence_of :min_players
  validates_presence_of :max_players
  validates_presence_of :playing_time
  validates_presence_of :complexity

end
