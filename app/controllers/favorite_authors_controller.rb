class FavoriteAuthorsController < ApplicationController
  def create
    @favorite_author = FavoriteAuthor.new(user: current_user, author: User.find(params[:author_id]))
    authorize @favorite_author
    if @favorite_author.save
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.json { render json: { id: @favorite_author.id } }
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.json { render json: { create: "false" } }
      end
    end
  end

  def destroy
    @favorite_author = FavoriteAuthor.find(params[:id])
    authorize @favorite_author
    if @favorite_author.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.json { render json: { destroy: "true" } }
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.json { render json: { destroy: "false" } }
      end
    end
  end
end
