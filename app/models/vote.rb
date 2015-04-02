class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  VOTE_TYPE = {
    -1 => "downvote",
    0 => "novote",
    1 => "upvote"
  }

  validates :vote_type, inclusion: { in: [-1, 0, 1], message: "%{vote_type} is not a valid vote." }
  validates :review, presence: true
  validates :user, presence: true

  def vote_type_name
    VOTE_TYPE[vote_type]
  end
end
