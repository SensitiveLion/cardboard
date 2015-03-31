class Review < ActiveRecord::Base
  belongs_to :game

  validates :user_id, presence: true
  validates :body, presence: true
  validates :game_rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates :game_id, presence: true
end
