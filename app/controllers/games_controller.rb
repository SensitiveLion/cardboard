class GamesController < ApplicationController



  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    # @review = Review.new
    # @reviews = Review.where(restaurant_id: @game.id)
  end

  def new
    @game = Game.new
  end


  def edit
    @game = Game.find(params[:id])
  end

  def create
  @game = Game.new(game_params)

    if @game.save
      flash[:notice] = 'you have added a new game!'
      redirect_to @game
    else
      @game.errors.full_messages.each do |error|
        flash[:notice] = "game not added"
      end
      render :new
    end
  end

  def destroy

  end

  protected

  def game_params
    params.require(:game).permit(:name, :description, :min_players, :max_players,
     :playing_time, :complexity, :designer, :release_date, :image_url )
  end
end
