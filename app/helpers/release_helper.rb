module ReleaseHelper

  def comic_info_link(user, issue)
    return issue_path(issue) if user.nil?
    if user.pull_list.include? issue.series
      #STAND IN FOR "REMOVE PULL" LINK
    else
      #STAND IN FOR "PULL IT" LINK
    end
  end

  def pull_it_text(user, issue)
    return issue.clean_title if user.nil?
    if user.pull_list.include? issue.series
      "Remove from List"
    else
      "Pull It"
    end
  end

  def navigation_helper(model)
    if model.nil?
      "nav-disabled"
    end
  end
end
