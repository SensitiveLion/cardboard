class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    before_action :authenticate_admin!
    @user = User.find(params[:id])
    if @user.authority == "user"
      @user.authority = "mod"
    elsif @user.authority == "mod"
      @user.authority = "user"
    end
    @user.save
    redirect_to user_path(@user)
  end

  protected

  def authenticate_admin!
  if !user_signed_in? || current_user.authority != "admin"
    raise ActionController::RoutingError.new("Not Found")
  end
end
