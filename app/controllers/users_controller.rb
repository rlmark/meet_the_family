class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    else
      @user
      render "welcome/index"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :username, :email, :password, :password_confirmation)
  end
end
