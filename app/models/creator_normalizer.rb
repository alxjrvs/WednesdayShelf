class CreatorNormalizer

  def initialize(creator)
    if creator == ""
      @creator = creator
    else
      @creator = creator.split(',')
    end
  end

  def format
    return nil if @creator == ""
    if @creator.size > 2
      multiple_names
    else
      normal_name
    end
  end

  def normal_name
    @creator.reverse.join(" ").strip
  end

  def multiple_names
    @creator.delete(' Various')
    normal_name
  end
end
