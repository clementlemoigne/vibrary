module StoriesConcern
  def recommended_stories
    @recommended_stories = policy_scope(Story).select { |story| story.tags.any? { |tag| current_user.whitelist.include?(tag) } }
    @recommended_stories = @recommended_stories.sort_by { |s| s.score_for_user(current_user) }.reverse
  end

  def best_stories
    @best_stories = policy_scope(Story).sort_by { |story| story.score }.reverse
  end

  def searched_stories
    @searched_terms = [params[:query], params[:tag], params[:vibration]].flatten.reject(&:blank?)
    @searched_stories = Story.global_search(@searched_terms)
    @searched_stories = policy_scope(@searched_stories)
    # if params[:vibration] == "on"
    #   @searched_stories = @searched_stories.filter { |story| story.vibration_compatibility }
    # else
    #   @searched_stories
    # end
  end
end
