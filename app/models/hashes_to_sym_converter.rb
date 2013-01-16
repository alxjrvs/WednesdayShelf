class HashesToSymConverter
# This takes the hash of hashes and rebrands all of them.

  def initialize(hash)
    @hash = hash
  end

  def rebrand
    @hash.keys.map do |key|
      RowToSymConverter.new(hash[key]).hashes_to_sym
    end
  end
end
