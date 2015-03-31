class ReviewsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.game_id = params[:game_id]

    if @review.save
      flash[:notice] = "review submitted."
      redirect_to game_path(@game)
    else
      flash[:notice] = "failed to submit"
      render :new
    end
  end

  def edit
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "you have successfully edited the review!"
      redirect_to game_path(@game)
    else
      flash[:notice] = "failed to update review"
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:game_id])
    Review.destroy(params[:id])
    redirect_to game_path(@game)
  end

  private

  def review_params
    params.require(:review).permit(:body, :game_rating)
  end
end
