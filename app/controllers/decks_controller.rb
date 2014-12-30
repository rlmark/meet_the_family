class DecksController < ApplicationController
  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(params.require(:deck).permit(:name))
    @deck.user_id = current_user.id
    if @deck.save
      redirect_to user_path(current_user.id)
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
