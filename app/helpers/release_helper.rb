module ReleaseHelper
  def navigation_helper(model)
    if model.nil?
      "nav-disabled"
    end
  end
end
