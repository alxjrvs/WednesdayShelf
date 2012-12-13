class HomeController < ApplicationController

  def index
    redirect_to release_url(Release.next.id)
  end

end
