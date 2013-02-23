class HomeController < ApplicationController

  def index
    @release = Release.next
    @release_date = @release.ship_date.strftime('%a %d, %b %Y')
    @home = true
    @issues = @release.issues_by_series
    render 'releases/show'
  end

end
