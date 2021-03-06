class Game < ActiveRecord::Base
  has_many :reviews, dependent: :destroy,
    :after_add => :update_average
  has_many :comments, through: :reviews
  has_many :game_tags
  has_many :tags, through: :game_tags
  belongs_to :user

  include PgSearch

  multisearchable against: [:name, :game_tags, :user]

  def self.search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

  mount_uploader :photo, GamePhotoUploader

  COMPLEXITIES = {
    1 => "low",
    2 => "medium",
    3 => "high",
    4 => "extreme"
  }

  validates :name, presence: true, uniqueness: true
  validates :user, presence: true
  validates :description, presence: true, length: { minimum: 64 }
  validates :min_players, presence: true, numericality: {
    less_than_or_equal_to: :max_players,
    message: "must be less than or equal to max players!",
    greater_than_or_equal_to: 1, message: "must be at least 1",
    only_integer: true
  }
  validates :max_players, presence: true, numericality: {
    greater_than_or_equal_to: 1, only_integer: true
  }
  validates :playing_time, presence: true, numericality: {
    greater_than_or_equal_to: 1, only_integer: true
  }
  validates :complexity, presence: true

  def complexity_name
    COMPLEXITIES[complexity]
  end

  def update_average
    s = reviews.sum(:game_rating)
    c = reviews.count
    update_attribute(:average, c == 0 ? 0.0 : s / c.to_f)
  end
end
