class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      flash[:notice] = 'you have added a new game!'
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
      flash[:notice] = 'you have successfully edited the game!'
      redirect_to @game
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find_by(user: current_user, id: params[:id])
    if !@game.nil?
      @games = Game.destroy(params[:id])
      flash[:notice] = 'Game deleted.'
      redirect_to action: "index"
    else
      flash[:notice] = "you can not delete other user's games"
      @game = Game.find_by(id: params[:id])
      render :edit
    end
  end

  protected

  def game_params
    params.require(:game).permit(
      :name, :description, :min_players, :max_players,
      :playing_time, :complexity
    )
  end
end
