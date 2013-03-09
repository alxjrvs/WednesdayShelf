class PreviewHashRebrander

  def initialize(hash)
    @hash = hash
  end

  def rebrand
    @hash.map do |key, value|
      RowToSymConverter.new(value).hashes_to_sym
    end
  end
end
