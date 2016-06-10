class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :current_user_can_edit_picture, only: [:edit, :update, :destroy]
  before_action :check_logged_in, only: [:new, :edit, :create, :update, :destroy]
  # GET /pictures/1
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
    @story = Story.find(params[:story])
    @username = @story.username
  end

  # GET /pictures/1/edit
  def edit
    @username = @picture.story.fullname
  end

  # POST /pictures
  def create
    @picture = current_user.pictures.build(picture_params)


    if @picture.save
        flash[:success] = "Picture was successfully created."
      redirect_to @picture
    else
      render :new
    end
  end

  # PATCH/PUT /pictures/1
  def update
      if @picture.update(picture_params)
        flash[:success] = "Picture was successfully updated."
        redirect_to @picture
      else
        render :edit
      end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @story = @picture.story
    @picture.destroy
    flash[:success] = "Picture was successfully destroyed."
    redirect_to story_url(@story)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:title, :avatar, :description, :time_taken, :story_id, :username)
    end

    def current_user_can_edit_picture
      if current_user.admin || @picture.story.user.id == current_user.id || @picture.user.id == current_user.id
        # all good
      else
        flash[:danger] = "Permission denied."
        redirect_to root_url
      end
    end
end
