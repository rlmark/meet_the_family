class DecksController < ApplicationController
  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(params.require(:deck).permit(:name))
    @deck.user_id = current_user.id
    if @deck.save
      session[:deck_id] = @deck.id
      redirect_to new_card_path
    else
      render :new
    end
  end

  def update
    @deck = Deck.update(params[:id], name: params[:deck][:name] )
    session[:deck_id] = @deck.id
    redirect_to edit_card_path
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to user_path(current_user.id)
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
