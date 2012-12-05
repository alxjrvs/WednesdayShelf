class HomeController < ApplicationController

  def index
    @release = Release.next.organized_issues
  end

end
