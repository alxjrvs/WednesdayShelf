class HomeController < ApplicationController

  def index
    @home = HomePageFacade.new(current_user)
  end

end
