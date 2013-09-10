class ReleasesController < ApplicationController

  respond_to :json

  def index
    respond_with Release.all
  end

  def show
    case params[:id]
    when 'current'
      respond_with Release.current
    else
      respond_with Release.find(params[:id])
    end
  end

end
