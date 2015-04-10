class UsersController < ApplicationController

  before_action :authenticate_admin!, only: [:update]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  # def update
  #   respond_to do |format|
  #     @user = User.find(params[:id])
  #     if @user.update(user_params)
  #       sign_in(@user == current_user ? @user : current_user, bypass: true)
  #       format.html {
  #         redirect_to @user,
  #         notice: 'Your profile was successfully updated.'
  #       }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def finish_signup
    if request.patch? && params[:user]
      if @user.update(user_params)
        sign_in(@user, bypass: true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.authority == "user"
      @user.authority = "mod"
    elsif @user.authority == "mod"
      @user.authority = "user"
    end
    @user.save
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    accessible = [:name, :email]
    accessible << [:password, :password_confirmation] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end

  protected

  def authenticate_admin!
    if !user_signed_in? || current_user.authority != "admin"
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
