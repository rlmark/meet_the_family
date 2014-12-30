class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Upon creation of new user, user is a seed relative 
      @user.is_a_relative
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      @user
      render "welcome/index"
    end
  end

  def update
    if current_user.update(user_params)
      flash.notice = "Your profile has been updated"
    end
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
