class ReactionsController < ApplicationController
  def create
    @reaction = Reaction.new(user: current_user, story: Story.find(params[:story_id]))
    authorize @reaction
    # Si j'ai cliqué sur like, @reaction.upvoted = true
    # Si j'ai cliqué sur dislike, @reaction.upvoted = false
    # Si j'ai cliqué sur un bouton actif (si j'avais déjà cliqué sur like ou dislike)
    # ma réaction est détruit.
    @reaction.save
  end

  def destroy
    @reaction = Reaction.find(params[:id])
    authorize @reaction
    @reaction.destroy
  end
end
