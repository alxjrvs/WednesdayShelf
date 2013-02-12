class MasterHasher
  #Turns the Master.csv into a hash
  def initialize(master)
    @master = master
  end

  def split_into_rows
    FileRowSplitter.new(@master).file
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
