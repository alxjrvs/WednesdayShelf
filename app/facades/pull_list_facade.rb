PullListFacade = Struct.new(:user) do

  def list
    user.pull_list
  end

  def series
    list.series
  end
end
