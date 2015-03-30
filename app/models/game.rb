class Game < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :min_players, presence: true
  validates :max_players, presence: true
  validates :playing_time, presence: true
  validates :complexity, presence: true

end
