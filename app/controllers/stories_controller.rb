class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @story = Story.new
    authorize @story
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.user_id
    authorize @story
    if @story.save
      redirect_to story_path(@story)
    else
      render :new
    end
  end

  def edit
    authorize @story
  end

  def update
    authorize @story
    @story.update(story_params)
    if @story.save
      redirect_to story_path(@story)
    else
      render :edit
    end
  end

  def destroy
    authorize @story
    @story.destroy
    redirect_to user_path(@story.user)
  end

  def story_params
    params.require(:story).permit(:title, :content, :synopsis)
  end

  def set_story
    @story = Story.find(params[:id])
  end
end
