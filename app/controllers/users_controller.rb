class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if current_user.authority == "admin"
      if @user.authority == "user"
        @user.authority = "mod"
      elsif @user.authority == "mod"
        @user.authority = "user"
      end
      @user.save
    end
    redirect_to user_path(@user)
  end
end
