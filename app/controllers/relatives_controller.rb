class RelativesController < ApplicationController
  def new
    @relative = Relative.new
  end

  def create
    @relative = Relative.new(relative_params)
    if @relative.save
      flash.notice = "Your relative was saved" 
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
