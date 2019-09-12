class CharactersController < ApplicationController
  before_action :set_character, only: [:display, :show, :edit, :update, :destroy]

  def show
  end

  def new
    @character = Character.new
    authorize @character
  end

  def create
    @character = Character.new(character_params)
    @character.user_id = current_user.id
    authorize @character
    if @character.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end


  def edit
    authorize @character
  end

  def update
    authorize @character
    @character.update(character_params)
    raise
    if @character.save
      redirect_to user_path(@character.user)
    else
      render :edit
    end
  end

  def destroy
    authorize @character
    @character.destroy
    redirect_to user_path(@character.user)
  end

  private

  def character_params
    params.require(:character).permit(
      :name,
      :description,
      :allies,
      :enemies,
      :race_id,
      :gender_id,
      :profession_id,
      :picture,
      :pdf
    )
  end

  def set_character
    @character = Character.find(params[:id])
  end

end
