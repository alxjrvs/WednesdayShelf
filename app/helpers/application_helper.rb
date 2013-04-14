module ApplicationHelper

  def body_classes
    [
      params[:controller],
      params[:action]
    ]
  end

  def interface_list
    if content_for?(:interface_list)
      content_for(:interface_list)
    end
  end

  def render_header
    if content_for?(:header)
      content_for(:header)
    else
      render 'shared/header'
    end
  end
end
