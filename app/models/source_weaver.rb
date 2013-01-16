class SourceWeaver
  #weave the two source documents - master.csv and db.txt - into a master hash
  def initialize(master, db)
    @master = MasterHasher.new(master).digest
    @db = DbHasher.new(db).digest
  end

  def digest
    total_hash = {}
    @master.each do |hash|
      hash["FULL_DESC"]  = @db[hash["DIAMD_NO"]]
      total_hash.merge!(hash["DIAMD_NO"] => hash )
    end
    total_hash
  end
end
