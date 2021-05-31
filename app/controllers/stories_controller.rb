class StoriesController < ApplicationController
  def index
    @recommended_stories = policy_scope(Story).select { |story| story.tags.any?{ |tag| current_user.whitelist.include?(tag)}}
    @recommended_stories = @recommended_stories.sort_by { |s| s.score_for_user(current_user) }.reverse
    @best_stories = policy_scope(Story).sort_by { |story| story.score }.reverse
    searched_terms = [params[:query], params[:tag]].flatten.reject(&:blank?)
    @searched_stories = Story.global_search(searched_terms)
    @searched_stories = policy_scope(@searched_stories)
  end

  def show
    @story = Story.find(params[:id])
    authorize @story
  end
end
