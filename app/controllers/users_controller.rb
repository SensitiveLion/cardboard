class UsersController < Devise::SessionsController
  def create
   @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User Created."
      redirect_to questions_path
    else
      flash[:notice] = "#{@user.errors}"
      render :new
    end
  end

  def show
    super
  end

  def destroy
    super
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username, :avatar_url,
    :first_name, :last_name, :location, :age)
  end
end
