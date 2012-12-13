class ReleasesController < ApplicationController

  def show
    @release = Release.where(:id => params[:id])[0]
    @release_date = @release.ship_date.strftime('%a %d, %b %Y')
    @issues = @release.issues_by_series
  end

end
