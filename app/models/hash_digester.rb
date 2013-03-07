class HashDigester
  #turns the files into hashes for source_weaving

  attr_reader :file

  def initialize(file)
    @file = file
  end

  def split_into_rows
    file.split("\r\n")
  end

  def get_keys
    split_into_rows[0].split("\t")
  end

  def digest
    diamond_keys = get_keys
    split_into_rows.map do |row|
      next if row.split("\t") == diamond_keys
      Hash[diamond_keys.zip(row.split("\t"))]
    end.compact
  end
end
