class UpvotesController < ApplicationController
  before_action :authenticate_user!
  def create
    vote = Upvote.find_or_create_by(params[:review_id, current_user])
    vote.upvote = true
    if
  end
end

# increment review.vote_score
# create a new upvote
# verify the user cant also downvote
# verify 1 vote per review per user
# mar
