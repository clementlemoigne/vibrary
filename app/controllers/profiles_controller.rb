class ProfilesController < ApplicationController
  def show
    @profile = User.find(current_user.id)
    authorize @profile
  end

  def edit
    @profile = User.find(current_user.id)
    authorize @profile
  end

  def update
    @profile = User.find(current_user.id)
    authorize @profile
    # params[:user][:whitelist].reject(&:empty?)
    @profile.update(profile_params)
    # raise
    if @profile.save
      redirect_to profile_path
    else
      render :new
    end
  end

  private

  def profile_params
    params.require(:user).permit(whitelist: [], blacklist: [])
  end
end
