class RelativesController < ApplicationController
  def new
    @relative = Relative.new
    @decks_relative = Relative.where(deck_id: session[:deck_id])
    @relatives = Relative.all
  end

  def create
    @relative = Relative.new(relative_params)
    @relative.deck_id = session[:deck_id]
    if @relative.save
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

  private

  def relative_params
    params.require(:relative).permit(:firstname, :lastname, :notes, :pronouns, :likes, :dislikes)
  end
end
