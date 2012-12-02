class HomeController < ApplicationController

  def index
    @books = Release.next.issues_by_series
  end

end
