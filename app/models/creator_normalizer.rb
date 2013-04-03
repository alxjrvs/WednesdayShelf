class CreatorNormalizer
  attr_reader :creator

  def initialize(creator)
    @creator = creator
  end

  def creator_array
    @_creator_array ||= creator.split(',')
  end

  def format
    return nil if @creator == ""
    if creator_array.size > 2
      multiple_names
    else
      normal_name
    end
  end

  def normal_name
    creator_array.reverse.join(" ").strip
  end

  #not fully implemented
  def multiple_names
    creator_array.delete(' Various')
    creator_array.map {|c| c.reverse.join("  ").strip}
    creator_array.join(',')
  end
end
