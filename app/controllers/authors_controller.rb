class AuthorsController < ApplicationController

  def show
    @author = Story.find(params[:id]).author
    authorize @author
  end
end
