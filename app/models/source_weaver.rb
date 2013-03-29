class SourceWeaver
  attr_reader :master, :db

  def initialize(master, db)
    @master = master
    @db = db
  end

  def master_hash
    @master_hash ||= FileToHasher.new(master, :master).digest
  end

  def db_hash
    @db_hash ||= FileToHasher.new(db, :db).digest
  end

  def fill_in_blurb(hash)
    if hash[:diamd_no] == "DIAMD_NO"
      hash[:full_desc] = "FULL_DESC"
    else
      hash[:full_desc] = db_hash[hash[:diamd_no]]
    end
  end

  def weave
    master_hash.map do |hash|
      fill_in_blurb(hash)
      hash
    end
  end
end
