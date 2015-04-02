class Downvote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :user, presence: true
  validates :review, presence: true
end
