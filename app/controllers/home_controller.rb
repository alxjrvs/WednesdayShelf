class HomeController < ApplicationController

  def index
    @home = ReleaseFacade.new(Release.current, current_user)
  end

end
