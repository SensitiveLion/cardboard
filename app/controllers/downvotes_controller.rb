class DownvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find(params[:review_id])
    Downvote.vote_helper(:down, review, current_user)
    redirect_to game_path(review.game)
  end
end
