class StoriesController < ApplicationController

  def index
    @stories = policy_scope(Story).order(created_at: :desc)
  end
end
