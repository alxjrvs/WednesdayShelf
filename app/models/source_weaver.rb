class SourceWeaver
  attr_reader :master, :db

  def initialize(master, db)
    @master = FileToHasher.new(master, :master).digest
    @db = FileToHasher.new(db, :db).digest
  end

  def fill_in_blurb(hash)
    hash["FULL_DESC"]  = @db[hash["DIAMD_NO"]]
  end
  def weave
    total_hash = {}
    @master.each do |hash|
      fill_in_blurb(hash)
      total_hash.merge! Hash[hash["DIAMD_NO"] => hash]
    end
    total_hash
  end
end
