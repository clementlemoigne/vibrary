class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
    @all_stories = Story.all
    @stories_bookmarked = Favorite.where(user_id: current_user.id).map(&:story)
    raise
  end

  def landing
  end

  private

  def isFavorite?
    @story = Story.find(params[:id])
  end
end
