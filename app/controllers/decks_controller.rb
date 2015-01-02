class DecksController < ApplicationController
  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(params.require(:deck).permit(:name))
    @deck.user_id = current_user.id
    if @deck.save
      session[:deck_id] = @deck.id
      redirect_to new_relative_path
    else
      render :new
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
end