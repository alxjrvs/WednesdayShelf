class HomeController < ApplicationController

  def index
    @release = Release.next
    @release_date = Release.next.ship_date.strftime('%a %d, %b %Y')
    @next_date = Release.week_after.ship_date.strftime('%a %d, %b %Y')
    @future_date = Release.two_weeks.ship_date.strftime('%a %d, %b %Y')
    @issues = @release.issues_by_series
  end

end
