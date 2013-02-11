class IssueImageUrlDigester

  def initialize(stock)
    @base = ENV['BASE_URL']
    @stock = stock.gsub("STK", "")
    @head = @stock[0]
    @key = @stock[1].to_i
    @trailing = @stock[2..30]
  end

  def digest
    if @key.odd?
      return "#{ENV['BASE_URL']}/Image/Display?pd=webdata/catalogimages/STK_IMAGES/STK#{@head}#{@key - 1}0001-#{@head}#{@key + 1}0000&pf=STK#{@stock}.jpg"
    elsif @trailing.to_i == 0
      return "#{ENV['BASE_URL']}/Image/Display?pd=webdata/catalogimages/STK_IMAGES/STK#{@head}#{@key - 2}0001-#{@head}#{@key}0000&pf=STK#{@stock}.jpg"
    else
      return "#{ENV['BASE_URL']}/Image/Display?pd=webdata/catalogimages/STK_IMAGES/STK#{@head}#{@key}0001-#{@head}#{@key + 2}0000&pf=STK#{@stock}.jpg"
    end
  end
end
