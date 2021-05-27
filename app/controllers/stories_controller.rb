class StoriesController < ApplicationController
  def index
    @stories = policy_scope(Story).order(created_at: :desc)
    if params[:query].present?
      @stories = Story.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @stories = Story.all
    end
  end
end
