class SourceWeaver
  attr_reader :master, :db

  def initialize(master, db)
    @master = FileToHasher.new(master, :master).digest
    @db = FileToHasher.new(db, :db).digest
  end

  def fill_in_blurb(hash)
    hash[:full_desc]  = db[hash[:diamd_no]]
  end

  def weave
    master.map do |hash|
      fill_in_blurb(hash)
      hash
    end
  end
end
