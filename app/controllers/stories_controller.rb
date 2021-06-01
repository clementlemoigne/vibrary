class StoriesController < ApplicationController
  include StoriesConcern

  def index
    recommended_stories
    best_stories
    searched_stories

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @story = Story.find(params[:id])
    authorize @story
  end
end
