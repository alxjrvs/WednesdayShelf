class HashesToSymConverter
# This takes the hash of hashes and rebrands all of them.

  def initialize(hash)
    @hash = hash
    @array = []
  end

  def rebrand
    @hash.each do |key, value|
      @array << RowToSymConverter.new(value).hashes_to_sym
    end
    return @array
  end
end
