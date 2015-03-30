class Review < ActiveRecord::Base

  validates :user_id, presence: true
  validates :body, presence: true
  validates :rating, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
  validates :upvotes, numericality: {only_integer: true}

end
