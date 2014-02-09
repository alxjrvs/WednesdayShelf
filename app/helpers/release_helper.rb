module ReleaseHelper
  def navigation_helper(model)
    if model.nil?
      "visibility:hidden"
    end
  end
end
