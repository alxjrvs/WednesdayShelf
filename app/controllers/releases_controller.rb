class ReleasesController < ApplicationController

  def show
    @release = ReleaseFacade.new(Release.find(params[:id]), current_user)
  end

end
