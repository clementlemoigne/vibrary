class ReactionsController < ApplicationController
  def create
    @reaction = current_user.reactions.find_by(story_id: params[:story_id])
    @reaction ||= Reaction.new(user: current_user, story_id: params[:story_id])
    @reaction.update(upvoted: params[:upvoted])
    authorize @reaction
    redirect_to story_path(params[:story_id])
  end
  
  def destroy
    raise
    @reaction = Reaction.find(params[:id])
    authorize @reaction
    @reaction.destroy
    redirect_to story_path(params[:story_id])
  end
end
