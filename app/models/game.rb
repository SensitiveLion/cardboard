class Game < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :comments, through: :reviews
  has_many :game_tags
  has_many :tags, through: :game_tags
  belongs_to :user

  mount_uploader :photo, GamePhotoUploader

  COMPLEXITIES = {
    1 => "low",
    2 => "medium",
    3 => "high",
    4 => "extreme"
  }

  validates :name, presence: true, uniqueness: true
  validates :user, presence: true
  validates :description, presence: true
  validates :min_players, presence: true
  validates :min_players, numericality: {
    less_than_or_equal_to: :max_players, message:
    "must be less than or equal to max players!"
  }
  validates :max_players, presence: true
  validates :playing_time, presence: true
  validates :complexity, presence: true

  def complexity_name
    COMPLEXITIES[complexity]
  end
end
