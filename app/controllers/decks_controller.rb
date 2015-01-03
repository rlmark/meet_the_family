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
    @deck = Deck.find(params[:id])
    if @deck.user_id != session[:user_id]
      redirect_to user_path(current_user.id)
      flash.notice = "That's not your deck"
    end
    @relatives = Relative.where(deck_id: params[:id])
    @relations = @relatives.collect do |relative|
      Relation.find_by(relative_id: relative.id)
    end

  end
end
