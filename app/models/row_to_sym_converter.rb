class RowToSymConverter
# takes a hash of string-keys and turns it into a hash of rails friendly symbols.
# also properly sanitizes them.
  def initialize(hash)
    @hash = hash
    @branded_hash = {}
  end

  def hashes_to_sym
    binding.pry
    @hash.keys.each do |key|
      keyvalue =  SanitizeDiamond.new(@hash[key]).string
      if key == "INCREMENT"
        @branded_hash[:increment_no] = keyvalue
      else
        @branded_hash[key.parameterize.underscore.to_sym] = keyvalue
      end
      return @branded_hash
    end
  end
end
