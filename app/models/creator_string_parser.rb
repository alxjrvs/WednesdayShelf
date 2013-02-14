class CreatorStringParser
  def initialize(key, value)
    @key = key
    @value =value
  end

  def parse
    return nil if @value == "#{@key} not found"
    case @key
    when :writer
      return "Written by #{@value}."
    when :artist
      return "Drawn by #{@value}."
    when :cover_artist
      return "Cover by #{@value}."
    when :same_artist_writer
      return "Written and Drawn by #{@value}."
    when :same_artist_cover
      return "Cover and Art by #{@value}."
    when :same_writer_cover
      return "Words and Cover by #{@value}."
    when :same_creator
      return "Written and Drawn by #{@value}."
    end
  end
end
