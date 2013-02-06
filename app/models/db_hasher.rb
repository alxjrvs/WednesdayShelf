class DbHasher
  #takes the db.txt file and turns it into a hash
  def initialize(file)
    @db = file
  end

  def split_into_rows
    FileRowSplitter.new(@db).file
  end

  def digest
    split_into_rows.map do |x| 
      x.gsub("\"", "").split("\t").map {|row| [row[0], row[3]]}
    end
  end
end
