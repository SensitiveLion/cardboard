class Game < ActiveRecord::Base
  has_many :reviews
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
