class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]

  def home
    @all_stories = Story.all.reverse
  end

  def landing
  end
end
