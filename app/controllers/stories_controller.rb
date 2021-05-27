class StoriesController < ApplicationController
  def index
    @stories = policy_scope(Story).order(created_at: :desc)
    if params[:query].present?
      @stories = Story.global_search(params[:query])
    else
      @stories = Story.all
    end
  end
  
  def show
    @story = Story.find(params[:id])
    authorize @story
  end
end
