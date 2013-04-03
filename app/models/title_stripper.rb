class TitleStripper

  attr_reader :title, :substring
  def initialize(title, substring)
    @title = title
    @substring = substring
  end

  def strip
    @_strip ||= title.gsub(substring, "")
  end

end
