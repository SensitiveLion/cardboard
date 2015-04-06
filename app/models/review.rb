class Review < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  has_many :upvotes, dependent: :destroy

  validates :user, presence: true
  validates :body, presence: true
  validates :game_rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates :game, presence: true
end
