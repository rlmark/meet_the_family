class RelativesController < ApplicationController
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
    redirect_to new_card_path
  end

  def create
    @relative = Relative.new(relative_params)
    @relative.deck_id = session[:deck_id]
    if @relative.save
      # Familymember id = the user as a relation
      relation = @relative.relations.new(relation_params)
      relation.familymember = current_user.relative
      relation.save
      redirect_to new_relative_path
    else
      render :new
    end
  end

  def update
    @relative = Relative.find(params[:id])
    @relative.update(relative_params)
    @relation = @relative.relations
    @relation[0].update(relation_params)
    redirect_to edit_card_path(session[:card_id])
  end

  def edit
    @relative = Relative.find(params[:id])
    @relation = Relation.find(@relative.relations[0].id)
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

  def relative_params
    params.require(:relative).permit(:firstname, :lastname, :notes, :pronouns, :likes, :dislikes, :avatar)
  end

  def relation_params
    params.require(:relation).permit(:title, :divorced, :step)
  end
end
