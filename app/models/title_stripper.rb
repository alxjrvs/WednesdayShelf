class TitleStripper
  def initialize(title)
    @title = title
  end

  def strip
    if @title.match(/^(.+)#\d+/)
      return @title.match(/^(.+)#\d+/).to_s
    else
      return @title.full_title
    end
  end
end
