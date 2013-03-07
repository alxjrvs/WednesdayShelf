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
    rows[0].split("\t")
  end

  def digest
    if filetype == :db
      Hash[rows.map do |x|
        x.gsub("\"", "").split("\t")
      end.map do |row|
        [row[0], row[3]]
      end]
    elsif filetype == :master
      split_into_rows.map do |row|
        next if row.split("\t") == keys
        Hash[keys.zip(row.split("\t"))]
      end.compact
    else
      puts "Boo"
    end
  end
end
