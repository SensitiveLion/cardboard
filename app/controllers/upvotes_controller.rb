class UpvotesController < ApplicationController
  before_action :authenticate_user!

  def create
    binding.pry
    review = Review.find_by(id: params[:review_id])
    Upvote.vote_helper(:up, review, current_user)
    redirect_to game_path(review.game)
  end
end
