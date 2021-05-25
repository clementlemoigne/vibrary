class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :buttplug ]

  def home
  end

  def buttplug
  end
end
