class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def settings
  end

  def show
  end

  def pull_list
    @pull_list = PullListFacade.new(current_user)
  end

  def remove_issue
    current_user.pull_list.series.delete(issue.series)
    flash[:notice] = "You've removed #{issue.series.title} from your pull list"
    redirect_to redirect_path
  end

  def add_issue
    current_user.pull_list.series << issue.series
    flash[:notice] = "You've Subscribed to #{issue.series.title}"
    redirect_to redirect_path
  end

  private

  def issue
    Issue.find(params[:issue_id])
  end

  def redirect_path
    params[:redirect_path] || root_path
  end

end
