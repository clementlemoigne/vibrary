class AuthorsController < ApplicationController

  def show
    @author = User.find(params[:id])
    authorize @author
  end
end
