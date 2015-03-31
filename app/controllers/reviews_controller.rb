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
      redirect_to show_games_path(@game)
    else
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
      flash[:notice] = 'you have successfully edited the review!'
      #FUCK THIS SHIT
      redirect_to "/games/#{@game.id}"
    else
      render :edit
    end
  end

  private
  def review_params
    params.require(:review).permit(:body, :game_rating)
  end
end
