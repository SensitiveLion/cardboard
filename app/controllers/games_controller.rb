class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @games_new = Game.order(created_at: :desc).limit(10)
    @games_rating = Game.order(average: :desc).limit(10)
    @games = Game.order(:name)
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews.order(:created_at).page params[:page]
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
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
      flash[:notice] = "failed to update game"
      render :edit
    end
  end

  def destroy
    if current_user.has_authority?
      @game = Game.find(params[:id])
    else
      @game = Game.find_by!(user: current_user, id: params[:id])
    end
    @game.destroy
    flash[:notice] = 'Game deleted.'
    redirect_to action: "index"
  end

  protected

  def game_params
    params.require(:game).permit(
      :name, :description, :min_players, :max_players,
      :playing_time, :complexity, :photo
    )
  end
end
