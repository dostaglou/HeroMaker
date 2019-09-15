class BiographiesController < ApplicationController
before_action :set_biography, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @biography = biography.new
    authorize @biography
  end

  def create
    @biography = biography.new(biography_params)
    @biography.user_id = current_user.id
    authorize @biography
    if @biography.save
      redirect_to biography_path(@biography)
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
      redirect_to biography_path(@biography)
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
    @biography = biography.find(params[:id])
  end
end
