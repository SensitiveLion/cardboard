class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = game.find(params[:id])
    # @review = Review.new
    # @reviews = Review.where(restaurant_id: @game.id)
  end

  def new
    @game = game.new
  end

  def create
  @game = game.new(game_params)
    if @game.save
      flash[:notice] = 'you have added a new game!'
      redirect_to @game
    else
      flash[:alert] = "game not added!"
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  protected

  def restaurant_params
    params.require(:game).permit(:name, :description, :min_players, :max_players,
     :playing_time, :complexity, :designer, :release_date, :image_url )
  end
end
