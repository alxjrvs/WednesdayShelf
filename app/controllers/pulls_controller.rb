class PullsController < ApplicationController

  def create
    if request.xhr?
      if Pull.create(series_id: series_id, pull_list_id: pull_list_id)
        render text: "It Worked!"
        return 200
      else
        render text: "It Didn't Work!"
        return 410
      end
    end
  end

  def destroy
    if request.xhr?
      if Pull.find(params[:id]).destroy
        render text: "It Worked!"
        return 200
      else
        render text: "It Didn't Work!"
        return 410
      end
    end
  end

  private

  def pull_list_id
    User.find(params[:user_id]).pull_list.id
  end

  def series_id
    Issue.find_by_diamond_number(params[:issue_diamond_number]).series_id
  end

end
