module ApplicationHelper

  def body_classes
    [
      params[:controller].parameterize,
      params[:action]
    ]
  end

  def comic_list(collection)
  end
end
