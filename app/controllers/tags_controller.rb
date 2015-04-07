class TagsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tag = Tag.new
    game_id = find_game_id
    @game = Game.find(game_id)
  end

  def create
    game_id = find_game_id
    @game = Game.find(game_id)
    name = tag_params[:name].downcase
    tag = Tag.new(name: name)
    if tag.save
      flash[:notice] = "new tag created"
      GameTag.create(game_id: @game.id, tag_id: tag.id)
      redirect_to game_path(@game)
    else
      flash[:notice] = "tag already exists"
      redirect_to action: "new", game: game_id
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_game_id
    if params[:game]
      params[:game]
    else
      params[:tag][:game_id]
    end
  end
end
