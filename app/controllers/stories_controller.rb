class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :check_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :user_owns_story, only: [:edit, :update, :destroy]

  # GET /stories/1
  def show
  end

  # GET /stories/new
  def new
    @story = current_user.stories.build
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  def create
    @story = current_user.stories.build(story_params)
    if @story.save
      flash[:success] = "Story was successfully created."
      redirect_to @story
    else
      render :new
    end
  end

  # PATCH /stories/1
  def update
    if @story.update(story_params)
      flash[:success] = "Story was successfully updated."
      redirect_to @story
    else
      render :edit
    end
  end

  # DELETE /stories/1
  def destroy
    @story.destroy!
    flash[:success] = "Story was successfully destroyed."
    redirect_to root_url
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      if current_user
        if current_user.admin == false
          params.require(:story).permit(:username, :description, :fullname, :avatar, :all_tags, :url)
        else
          params.require(:story).permit(:username, :description, :followers, :frequency, :fullname, :verified, :avatar, :all_tags, :url)
        end
      else
        flash[:danger] = "Please log in."
        redirect_to root_url
      end
    end

    def user_owns_story
      if current_user
        if @story.user != current_user && current_user.admin == false
          flash[:danger] = "Permission denied."
          redirect_to root_url
        end
      else
        flash[:danger] = "Permission denied."
        redirect_to root_url
      end
    end
end
