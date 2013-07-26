module ApplicationHelper

  def body_classes
    [
      params[:controller].parameterize,
      params[:action]
    ]
  end
end
