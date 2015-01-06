class CardsController < ApplicationController
  def index
  end

  def new
    # For the name of the deck
    @deck = Deck.find(session[:deck_id])

    # Join table
    @relation = Relation.new

    # Three column layout
    # new relative form
    @relative = Relative.new
    # the relatives in ths particular deck
    @decks_relative = Relative.where(deck_id: session[:deck_id])
    # the relatives belonging to the user
    relations = Relation.where(familymember_id: current_user.relative_id)
    @relatives = relations.collect do |join|
      join.relative
    end
  end

  def create
    raise params.inspect
    @relative = Relative.new(relative_params)
    @relative.deck_id = session[:deck_id]
    if @relative.save
      # Familymember id = the user as a relation
      relation = @relative.relations.new(relation_params)
      relation.familymember = current_user.relative
      relation.save
      redirect_to new_card_path
    else
      render :new
    end
  end

  def show
  end

  def update
    if params[:add]
      @relative = Relative.find(params[:add])
      @relative.deck_id = session[:deck_id]
      @relative.save
      redirect_to new_card_path
    end
    if params[:subtract]
      @relative = Relative.find(params[:subtract])
      @relative.deck_id = nil
      @relative.save
      redirect_to new_card_path
    end
  end

  def destroy
  end

  def edit
    @deck = Deck.find(session[:deck_id])
    @relative = Relative.new
    @relation = Relation.new
    @decks_relative = Relative.where(deck_id: session[:deck_id])
    # the relatives belonging to the user
    relations = Relation.where(familymember_id: current_user.relative_id)
    @relatives = relations.collect do |join|
      join.relative
    end
  end

  private

  def relative_params
    params.require(:relative).permit(:firstname, :lastname, :notes, :pronouns, :likes, :dislikes, :avatar)
  end

  def relation_params
    params.require(:relation).permit(:title, :divorced, :step)
  end
end
