class HomeController < ApplicationController

  def index
    @release = Release.next
    @issues = @release.issues_by_series
  end

end
