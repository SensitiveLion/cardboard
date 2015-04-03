class Game < ActiveRecord::Base
  has_many :reviews, dependent: :destroy,
  :after_add => :update_average,
  :after_remove => :update_average
  has_many :comments, through: :reviews
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

  def update_average(review=nil)
     s = self.reviews.sum(:game_rating)
     c = self.reviews.count
     self.update_attribute(:average, c == 0 ? 0.0 : s / c.to_f)
  end
end
