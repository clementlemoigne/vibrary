class ProfilesController < ApplicationController
  def show
    @profile = User.find(current_user.id)
    authorize @profile
  end

  def edit

  end

  def update
  end
end
