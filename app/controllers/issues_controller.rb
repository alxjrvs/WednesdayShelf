class IssuesController < ApplicationController
  respond_to :json

  def index
    respond_with Issue.all
  end

  def show
    respond_with Issue.find(params[:id])
  end

end
