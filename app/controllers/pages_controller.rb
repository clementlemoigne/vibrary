class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :buttplug]

  def home
    @all_stories = policy_scope(Story).sort_by { |story| story.created_at }
    @stories_bookmarked = Favorite.where(user_id: current_user.id).map(&:story)
    @stories_current_reading = Reading.where(user_id: current_user.id).map(&:story)
    # @stories_for_you = Story.where( (current_user.whitelist & Story.first.tags))
    # @stories_for_you = Story.where(tags: current_user.whitelist)
    # @stories_for_you = Story.includes(tags: current_user.whitelist & Story.first.tags)
    # raise
  end

  def landing
  end

  def buttplug
  end
end
