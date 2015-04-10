class TagsController < ApplicationController
  before_action :authenticate_user!

  def new
    if !find_game_id.nil?
      @tag = Tag.new
      @game = Game.find(find_game_id) if !find_game_id.nil?
    else
      # user tries to add a tag without going through a game
      # we don't want tags not in use, go back to games index
      redirect_to games_path
    end
  end

  def create
    @game = Game.find(find_game_id)
    tag = Tag.new(tag_params)
    if tag.save
      flash[:notice] = "new tag created"
      gametag = GameTag.new(game_id: @game.id, tag_id: tag.id)
      if @game.nil?
        redirect_to games_path
      elsif gametag.save
        redirect_to game_path(@game)
      else
        # this should never happen.  a newly created tag
        # is by definition unused within the scope of all games
        flash[:notice] = "new tag created - but unable to save it to game"
        redirect_to game_path(@game)
      end
    else
      flash[:notice] = "tag already exists"
      redirect_to action: "new", game: @game.id
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_game_id
    if params[:game]
      params[:game]
    elsif params[:tag]
      params[:tag][:game_id]
    end
  end
end
