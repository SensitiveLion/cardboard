class Upvote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :user, presence: true
  validates :review, presence: true

  def self.vote_helper(direction, review, user)
    down = Downvote.find_or_create_by(
      review_id: review.id, user_id: user.id
    )
    up = Upvote.find_or_create_by(
      user_id: user.id, review_id: review.id
    )
    if direction == :up
      new_vote = up
      other_vote = down
    elsif direction == :down
      new_vote = down
      other_vote = up
    end
    if new_vote.vote
      new_vote.vote = false
      change = -1
    elsif other_vote.vote
      other_vote.vote = false
      new_vote.vote = true
      change = 2
    else
      new_vote.vote = true
      change = 1
    end
    if direction == :up
      review.vote_count += change
    elsif direction == :down
      review.vote_count -= change
    end
    new_vote.save
    other_vote.save
    review.save
  end
end
