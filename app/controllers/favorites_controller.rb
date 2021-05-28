class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user: current_user, story: Story.find(params[:story_id]))
    authorize @favorite
    @favorite.save
    redirect_to landing_path
  end
end
