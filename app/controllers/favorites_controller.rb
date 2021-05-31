class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user: current_user, story: Story.find(params[:story_id]))
    authorize @favorite
    @favorite.save
    if params["location"]
      redirect_to story_path(Story.find(params[:story_id]))
    else
     redirect_to landing_path(anchor: "story-#{params[:story_id]}")
    end
  end

  def destroy
    # raises
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    @favorite.destroy
    if params["location"]
      redirect_to story_path(Story.find(@favorite.story.id))
   else
    redirect_to landing_path
   end
  end
end
