class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  def show
    @stories = @tag.stories
    @articles = @tag.articles
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end
end
