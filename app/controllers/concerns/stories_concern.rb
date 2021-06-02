module StoriesConcern
  def recommended_stories
    @recommended_stories = policy_scope(Story).select { |story| story.tags.any? { |tag| current_user.whitelist.include?(tag) } }
    @recommended_stories = @recommended_stories.sort_by { |s| s.score_for_user(current_user) }.reverse
  end

  def best_stories
    @best_stories = policy_scope(Story).sort_by { |story| story.score }.reverse
  end

  def searched_stories
    @stories = policy_scope(Story)

    @searched_terms = [params[:tag]].flatten.reject(&:blank?)
    @searched_terms << params[:query] if params[:query].present?

    @stories = @stories.global_search(@searched_terms) if @searched_terms.any?

    @stories = @stories.where(vibration_compatibility: true) if params[:vibration]
  end
end
