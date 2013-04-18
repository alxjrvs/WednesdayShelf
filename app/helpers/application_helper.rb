module ApplicationHelper

  def body_classes
    [
      params[:controller],
      params[:action]
    ]
  end

  def render_interface_pane
    if content_for?(:interface_pane)
      content_for(:interface_pane)
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
