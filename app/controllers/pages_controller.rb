class PagesController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [ :landing, :buttplug ]

  def home
    @all_stories = Story.all
    @stories_bookmarked = Favorite.where(user_id: current_user.id).map(&:story)
  end

  def landing
  end

  def buttplug
  end
end
