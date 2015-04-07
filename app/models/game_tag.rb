class GameTag < ActiveRecord::Base
  belongs_to :game
  belongs_to :tag

  validates :tag_id, presence: true
  validates :game_id, presence: { message: "already has this tag" }
  validates :tag_id, scope: :game_id, uniqueness: true
end
