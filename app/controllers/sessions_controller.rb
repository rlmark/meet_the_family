class SessionsController < ApplicationController
  skip_before_filter :authenticated?, :only => :create
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      flash.alert = "Invalid email or password"
      @user = User.new
      render "welcome/index"
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
