class Comment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :user, presence: true
  validates :review, presence: true
  validates :body, presence: true,
            length: { minimum: 15 }
end
