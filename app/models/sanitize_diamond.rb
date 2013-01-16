class SanitizeDiamond
#Sanitize and normalize the strings for diamond parsing.
  attr_reader :string
  def initialize(string)
    @string = string.to_s.unpack("C*").pack("U*")
  end
end
