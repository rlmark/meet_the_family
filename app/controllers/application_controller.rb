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
    if current_member == nil
      redirect_to root_path
    end
  end

  helper_method :current_user
end
