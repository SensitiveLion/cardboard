class DownvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find(params[:review_id])
    Downvote.vote_helper(:down, review, current_user)

    respond_to do |format|
      format.html { redirect_to game_path(review.game) }
      format.js {}
    end
  end
end
