class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = review_by_id
    @comment = Comment.new
    @game = Game.find(@review.game_id)
  end

  def create
    @comment = Comment.new(comment_params)
    @review = review_by_id
    @comment.review = @review
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "comment submitted."
      redirect_to game_path(Game.find(@review.game_id))
    else
      flash[:notice] = "failed to submit"
      render :new
    end
  end

  def edit
    @comment = user_comment
    @review = @comment.review
    @game = @comment.review.game
  end

  def update
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @game = @comment.review.game
    if @comment.update(comment_params)
      flash[:notice] = "you have successfully edited the comment!"
      redirect_to game_path(@game)
    else
      flash[:notice] = "failed to update comment"
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @game = Game.find(@comment.review.game_id)
    @comment.destroy
    flash[:notice] = "comment deleted"
    redirect_to game_path(@game)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def user_comment
    current_user.comments.find(params[:id])
  end

  def review_by_id
    Review.find(params[:review_id])
  end
end
