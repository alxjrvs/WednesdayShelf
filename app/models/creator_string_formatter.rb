class CreatorStringFormatter

  def initialize(issue)
    @creator_hash = {writer: issue.writer, artist: issue.artist, cover_artist: issue.cover_artist}
  end

  def remove_nil
    @creator_hash.each do |k, v|
      @creator_hash[k] = "#{k} not found" if v == nil or v == "TBD"
    end
  end

  def format
    remove_nil
    if @creator_hash.values.uniq.size == 1
      same_creator
    elsif @creator_hash[:writer] == @creator_hash[:artist]
      same_artist_writer
    elsif @creator_hash[:artist] == @creator_hash[:cover_artist]
      same_artist_cover
    elsif @creator_hash[:writer] == @creator_hash[:cover_artist]
      same_writer_cover
    end
    parse_to_human_readable
    formatted_string
  end

  def parse_to_human_readable
    @creator_hash.each do |k, v|
      @creator_hash[k] = CreatorStringParser.new(k, v).parse
    end
  end
  def same_artist_writer
    @creator_hash = {same_artist_writer: @creator_hash[:writer], cover_artist: @creator_hash[:cover_artist]}
  end

  def same_artist_cover
    @creator_hash = {same_artist_cover: @creator_hash[:artist], writer: @creator_hash[:writer]}
  end

  def same_writer_cover
    @creator_hash = {same_writer_cover: @creator_hash[:writer], artist: @creator_hash[:artist]}
  end

  def same_creator
    @creator_hash = {same_creator: @creator_hash[:writer]}
  end

  def formatted_string
    return @creator_hash.values
  end
end
