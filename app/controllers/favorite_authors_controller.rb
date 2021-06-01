class FavoriteAuthorsController < ApplicationController

  def create
    @favorite_author = FavoriteAuthor.new(user: current_user, author: User.find(params[:author_id]))
    authorize @favorite_author
    @favorite_author.save
    redirect_to request.referrer
  end

  def destroy
    @favorite_author = FavoriteAuthor.find(params[:id])
    authorize @favorite_author
    @favorite_author.destroy
    redirect_to request.referrer
  end
end
