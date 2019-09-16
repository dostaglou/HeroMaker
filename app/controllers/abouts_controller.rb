class AboutsController < ApplicationController
  before_action :set_about, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @about = About.new
    authorize @about
  end

  def create
    @about = About.new(about_params)
    @about.user_id = current_user.id
    authorize @about
    if @about.save
      redirect_to user_path(@about.user)
    else
      render :new
    end
  end

  def edit
    authorize @about
  end

  def update
    authorize @about
    @about.update(about_params)
    if @about.save
      redirect_to user_path(@about.user)
    else
      render :edit
    end
  end

  def destroy
    authorize @about
    @about.destroy
    redirect_to user_path(@about.user)
  end

  private

  def about_params
    params.require(:about).permit(:about)
  end

  def set_about
    @about = About.find(params[:id])
  end

end
