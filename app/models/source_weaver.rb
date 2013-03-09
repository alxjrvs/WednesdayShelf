class SourceWeaver
  attr_reader :master, :db

  def initialize(master, db)
    @master = FileToHasher.new(master, :master).digest
    @db = FileToHasher.new(db, :db).digest
  end

  def fill_in_blurb(hash)
    hash["FULL_DESC"]  = db[hash["DIAMD_NO"]]
  end

  def weave
    master.map do |hash|
      fill_in_blurb(hash)
      hash
    end
  end
end
