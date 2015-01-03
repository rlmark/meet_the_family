class WelcomeController < ApplicationController
  skip_before_filter :authenticated?, :only => :index
  
  def index
    @user = User.new
  end
end
