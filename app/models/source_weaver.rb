class SourceWeaver
  attr_reader :master, :db

  def initialize(master, db)
    @master = FileToHasher.new(master, :master).digest
    @db = FileToHasher.new(db, :db).digest
  end

  def fill_in_blurb(hash)
    if hash[:diamd_no] == "DIAMD_NO"
      hash[:full_desc] = "FULL_DESC"
    else
      hash[:full_desc] = db[hash[:diamd_no]]
    end
  end

  def weave
    master.map do |hash|
      fill_in_blurb(hash)
      hash
    end
  end
end
