class GameTag < ActiveRecord::Base
  belongs_to :game
  belongs_to :tag

  validates :tag, presence: true
  validates :game, presence: { message: "already has this tag" }
  validates :tag, uniqueness: {scope: :game_id}
end
