class ReleasesController < ApplicationController

  def show
    if params[:id].present?
      @release = Release.where(:id => params[:id])[0]
    else
      @release = Release.next
    end
    @issues = @release.issues_by_series
  end
end
