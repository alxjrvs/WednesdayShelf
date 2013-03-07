class SourceWeaver
  #weave the two source documents - master.csv and db.txt - into a master hash
  def initialize(master, db)
    @master = FileHasher.new(master, :master).digest
    @db = FileHasher.new(db, :db).digest
  end

  def fill_in_blurb(hash)
    hash["FULL_DESC"]  = @db[hash["DIAMD_NO"]]
  end
  def digest
    total_hash = {}
    @master.each do |hash|
      fill_in_blurb(hash)
      total_hash.merge! Hash[hash["DIAMD_NO"] => hash]
    end
    total_hash
  end
end
