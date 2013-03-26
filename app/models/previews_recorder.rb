class PreviewsRecorder
  attr_reader :preview_hash, :preview

  def initialize(preview_hash)
    @preview_hash = preview_hash
    @preview = Preview.create
  end

  def sanitize_string(string)
    string = string.to_s.unpack("C*").pack("U*")
  end

  def rebrand_hashes
    rebranded_hashes = []
    preview_hash.each do|hash|
      next if hash[:diamd_no] == "DIAMD_NO"
      mini_hash ={}
      hash.each do |key, value|
        value = sanitize_string(value)
        key = :increment_no if key == :increment
        mini_hash.merge! Hash[key, value]
      end
      rebranded_hashes << mini_hash
    end
    rebranded_hashes
  end

  def record
    rebrand_hashes.each do |listing|
      ListingRecorder.new(listing, preview).record
    end
  end
end
