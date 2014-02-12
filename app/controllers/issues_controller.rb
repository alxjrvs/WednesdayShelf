class IssuesController < ApplicationController

  def show
    @show =  IssueFacade.new(issue, current_user)
  end

  def remove_from_list
    #if current_user.nil?
      #flash[:error] = "Please sign in to continue"
      #redirect_to sign_in_path
    #end
    #current_user.pull_list.series.delete(issue.series)
    #flash[:notice] = "You've removed #{issue.series.title} from your pull list"
    #redirect_to issue_path(issue)
  end

  def add_to_list
    if request.format.js?
      if current_user.nil?
        flash[:error] = "You'll need to sign in to subscribe to #{issue.clean_title}"
        redirect_to sign_in_path
      end
      current_user.pull_list.series << issue.series
      flash[:notice] = "You've Subscribed to #{issue.series.title}"
    end
  end

  private

  def issue
    @_issue ||= Issue.find((params[:id] || params[:issue_id]))
  end

end
