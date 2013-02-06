class FileRowSplitter

  attr_reader :file

  def initialize(file)
    @file = file.split("\r\n")
  end

end
