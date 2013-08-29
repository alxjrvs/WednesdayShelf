class HomeController < ApplicationController

  def splash
  end

  def index
    @release = Release.current
  end

end
