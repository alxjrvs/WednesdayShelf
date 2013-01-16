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
    ending_hash = []
    split_file.each do |row|
      next if row.split("\t").size != 42
      next if row.split("\t") == get_keys
      ending_hash << Hash[get_keys.zip(row.split("\t"))]
    end
    ending_hash
  end
end
