class FileToHasher
  attr_reader :file, :filetype

  def initialize(file, filetype)
    @file = file
    @filetype = filetype
  end

  def rows
    file.split("\r\n")
  end

  def keys
    rows[0].split("\t").map(&:downcase).map(&:to_sym)
  end

  def digest_db
    Hash[rows.map do |x|
      x.gsub("\"", "").split("\t")
    end.map do |row|
      [row[0], row[3]]
    end]
  end

  def digest_master
    rows.map do |row|
      next if row.split("\t") == keys
      Hash[keys.zip(row.split("\t"))]
    end.compact
  end

  def digest
    case filetype
    when :db
      digest_db
    when :master
      digest_master
    end
  end
end
