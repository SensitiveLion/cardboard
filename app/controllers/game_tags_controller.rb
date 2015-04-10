class GameTagsController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.find(params[:game_id])
    @game_tag = GameTag.new
  end

  def create
    unless params[:game_tag]
      flash[:alert] = "you must select or create a tag"
      @game = Game.find(params[:game_id])
      @game_tag = GameTag.new
      redirect_to new_game_game_tag_path(@game)
    else
      @game_tag = GameTag.new(tag_params)
      @game = Game.find(params[:game_id])
      @game_tag.game = @game
      if @game_tag.save
        flash[:notice] = "game tagged"
        redirect_to game_path(params[:game_id])
      else
        flash[:notice] = "tag not saved"
        render :new
      end
    end
  end

  def tag_params
    params.require(:game_tag).permit(:tag_id)
  end
end
