class DashboardsController < ApplicationController
  def show
    authorize current_user
  end
end
