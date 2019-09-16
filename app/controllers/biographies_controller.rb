class BiographiesController < ApplicationController
before_action :set_biography, only: [:show, :edit, :update, :destroy]
before_action :set_character, only: [:new, :create, :edit, :update, :destroy]
  def show
  end

  def new
    @biography = Biography.new
    authorize @biography
  end

  def create
    @biography = Biography.new(biography_params)
    @biography.character_id = @character.id
    authorize @biography
    if @biography.save
      redirect_to character_path(@biography.character)
    else
      render :new
    end
  end

  def edit
    authorize @biography
  end

  def update
    authorize @biography
    @biography.update(biography_params)
    if @biography.save
      redirect_to character_path(@biography.character)
    else
      render :edit
    end
  end

  def destroy
    authorize @biography
    @biography.destroy
    redirect_to user_path(@biography.user)
  end

  private

  def biography_params
    params.require(:biography).permit(
      :title,
      :chapter
    )
  end

  def set_biography
    @biography = Biography.find(params[:id])
  end

  def set_character
    @character = Character.find(params[:character_id])
  end
end
