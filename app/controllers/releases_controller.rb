class ReleasesController < ApplicationController

  def show
    @release = ReleaseFacade.new(Release.find(params[:id]))
  end

end
