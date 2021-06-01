class AuthorsController < ApplicationController

  def show
    @author = User.find(params[:id])
    authorize @author
    @top_stories = @author.stories.sort_by{ |story| story.score}.reverse!.first(5)
  end
end
