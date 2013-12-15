class IssuesController < ApplicationController

  def show
    @show =  IssueFacade.new(issue, current_user)
  end

  private

  def issue
    Issue.where(id: params[:id]).includes(:covers).first
  end

end
