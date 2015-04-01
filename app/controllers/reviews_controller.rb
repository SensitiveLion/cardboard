class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @game = Game.find(params[:game_id])
    @review.game = @game
    @review.user = current_user

    if @review.save
      flash[:notice] = "review submitted."
      redirect_to game_path(@game)
    else
      flash[:notice] = "failed to submit"
      render :new
    end
  end

  def edit
    @review = user_review
  end

  def update
    @review = user_review
    @game = @review.game
    if @review.update(review_params)
      flash[:notice] = "you have successfully edited the review!"
      redirect_to game_path(@game)
    else
      flash[:notice] = "failed to update review"
      render :edit
    end
  end

  def destroy
    @review = user_review
    review.destroy
    redirect_to review.game
  end

  private

  def review_params
    params.require(:review).permit(:body, :game_rating)
  end

  def user_review
    current_user.reviews.find(params[:id])
  end
end
