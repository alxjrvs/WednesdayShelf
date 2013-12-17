module ApplicationHelper

  def body_classes
    [
      params[:controller].parameterize,
      params[:action]
    ]
  end

  def pull_list_link(issue)
    if user_signed_in?
      if current_user.subscribed_to?(issue) 
        remove_issue_from_pull_list_user_path(current_user)
      else
        add_issue_to_pull_list_user_path(current_user)
      end
    else
      new_user_session_path
    end
  end
end
