class DownvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find_by(id: params[:review_id])
    down = Downvote.find_or_create_by(
    review_id: review.id, user_id: current_user.id
    )
    up = Upvote.find_by(user_id: current_user.id, review_id: review.id)
      if up == nil || up.upvote == false
        down.downvote = true
        review.decrement!(:vote_count)
      else
        up.upvote = false
        down.downvote = true
        review.decrement!(:vote_count)
      end
      redirect_to game_path(review.game)
  end
end
