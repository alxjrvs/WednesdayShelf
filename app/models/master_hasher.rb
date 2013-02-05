class MasterHasher
  #Turns the Master.csv into a hash
  def initialize(master)
    @master = master
  end

  def split_file
    @master.split("\r\n")
  end

  def get_keys
    split_file[0].split("\t")
  end

  def digest
    split_file.map do |row|
      next if row.split("\t") == get_keys
      Hash[get_keys.zip(row.split("\t"))]
    end.compact
  end
end
