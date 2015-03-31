class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews.order(:created_at)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = "you have added a new game!"
      redirect_to @game
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = "you have successfully edited the game!"
      redirect_to @game
    else
      render :edit
    end
  end

  def destroy
    Game.destroy(params[:id])
    redirect_to "/games"
  end

  protected

  def game_params
    params.require(:game).permit(:name, :description, :min_players, :max_players,
     :playing_time, :complexity )
  end
end
