class HashesToSymConverter
# This takes the hash of hashes and rebrands all of them.

  def initialize(hash)
    @hash = hash
  end

  def rebrand
    @hash.each do |key, value|
      binding.pry
      @hash[key] = RowToSymConverter.new(value).hashes_to_sym
    end
    return @hash
  end
end
