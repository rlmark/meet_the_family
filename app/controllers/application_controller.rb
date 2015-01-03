class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # TO DO: make this work, probably with before_filter
  def authenticated?
    if @current_user == nil
      redirect_to root_path
  # This doesn't work. Need to say, if the current user's id is not the corresponding relations id, dont' show their family info.
    end
  end


  helper_method :current_user
  #before_action :authenticated?
end
