class IssuesController < ApplicationController

  def show
    @show =  IssueFacade.new(Issue.find(params[:id]), current_user)
  end

end
