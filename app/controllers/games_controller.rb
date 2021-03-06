class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    if params[:query]
      @pg_search_result = PgSearch.multisearch(params[:query])
      @games = []
      @pg_search_result.each do |result|
        @games << Game.find(result.searchable_id)
      end
    end
    @games_rating = Game.order(average: :desc).limit(10)
    @games_name = Game.order(:name)
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
    flash[:notice] = 'game deleted.'
    redirect_to action: "index"
  end

  protected

  def game_params
    if current_user.has_authority?
      params.require(:game).permit(
        :name, :description, :min_players, :max_players,
        :playing_time, :complexity, :photo, :amazon_html
      )
    else
      params.require(:game).permit(
        :name, :description, :min_players, :max_players,
        :playing_time, :complexity, :photo
      )
    end
  end
end
