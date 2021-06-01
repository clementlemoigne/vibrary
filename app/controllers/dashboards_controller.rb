class DashboardsController < ApplicationController
  def show
    authorize current_user
    @stories = Story.where(author_id: current_user)
  end
end
