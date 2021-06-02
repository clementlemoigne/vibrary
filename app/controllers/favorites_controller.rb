class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(user: current_user, story: Story.find(params[:story_id]))
    authorize @favorite
    if @favorite.save
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.json { render json: {
          id: @favorite.id
        }}
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.json { render json: {
          create: 'false'
        }}
      end
    end

    # redirect_to request.referrer
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    authorize @favorite
    if @favorite.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.json { render json: {
          destroy: 'true'
        }}
      end
    else
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.json { render json: {
          destroy: 'false'
        }}
      end
    end
  end

end
