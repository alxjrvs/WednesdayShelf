class ReleasesController < ApplicationController

  def show
    @release = Release.find(params[:id])
    @next = @release.next
    @previous = @release.previous
  end

end
