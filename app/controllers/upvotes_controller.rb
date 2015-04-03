class UpvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find_by(id: params[:review_id])
    up = Upvote.find_or_create_by(
      review_id: review.id, user_id: current_user.id
    )
    down = Downvote.find_by(user_id: current_user.id, review_id: review.id)
      if down == nil || down.downvote == false
        up.upvote = true
        review.increment!(:vote_count)
      else
        down.downvote = false
        up.upvote = true
        review.increment!(:vote_count)
      end
      redirect_to game_path(review.game)
  end
end
