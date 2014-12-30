class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Upon creation of new user, create user as relative
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      @user
      render "welcome/index"
    end
  end

  def update
    current_user.update(user_params)
    redirect_to user_path
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
  end
end
