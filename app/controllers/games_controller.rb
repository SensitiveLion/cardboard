class GamesController < ApplicationController
  before_action :authenticate_user!, only: [
    :new, :create, :edit, :update, :destroy
  ]

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
    if Game.find(params[:id])
      @game = Game.find(params[:id])
      if current_user.id == @game.user_id
        @games = Game.destroy(params[:id])
        flash[:notice] = 'Game deleted.'
        redirect_to action: "index"
      else
        flash[:notice] = "you can not delete other user's games"
        render :edit
      end
    end
  end

  protected

  def game_params
    params.require(:game).permit(
      :name, :description, :min_players, :max_players,
      :playing_time, :complexity, :user_id
    )
  end
end
