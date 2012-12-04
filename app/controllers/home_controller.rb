class HomeController < ApplicationController

  def index
    @release = Release.next.issues_by_series
  end

end
