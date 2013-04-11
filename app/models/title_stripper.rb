class TitleStripper

  attr_reader :title, :substring
  def initialize(title, substring)
    @title = title
    @substring = substring
  end

  def strip
    return @_strip if @_strip.present?
    basic_title = title.gsub(substring.squish, "").squish
    paren_string = basic_title.split(/#\d+/)[1].to_s
    final_title = basic_title.gsub(paren_string, '')
    @_strip = final_title.strip
  end

end
