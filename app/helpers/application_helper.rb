module ApplicationHelper

  def body_classes
    [
      params[:controller].parameterize,
      params[:action]
    ]
  end

  def release_navigation_helper(release)
    if release.nil?
      "nav-disabled"
    end
  end
end
