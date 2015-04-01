class ReviewsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
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
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
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
    review = current_user.reviews.find(params[:id])
    review.destroy
    redirect_to review.game
  end

  private

  def review_params
    params.require(:review).permit(:body, :game_rating)
  end
end
