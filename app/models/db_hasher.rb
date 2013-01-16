class DbHasher
  #takes the db.txt file and turns it into a hash
  def initialize(file)
    @db = file
  end

  def digest
    Hash[@db.split("\r\n").map { |x| x.gsub("\"", "").split("\t") }.map {|row| [row[0], row[3]]}]
  end
end
