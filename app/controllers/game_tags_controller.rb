class GameTagsController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.find(params[:game_id])
    @game_tag = GameTag.new
  end

  def create
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

  def tag_params
    params.require(:game_tag).permit(:tag_id)
  end
end
