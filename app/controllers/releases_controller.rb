class ReleasesController < ApplicationController
  before_action :validate_session, only: [:show]

  def show
    @release = Release.find(params[:id])
    @next = @release.next
    @previous = @release.previous
  end

end
