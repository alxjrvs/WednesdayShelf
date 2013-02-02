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
      return "#{ENV['BASE_URL']}/Image/Display?pd=webdata/catalogimages/STK_IMAGES/STK#{head_num}#{key_num - 1}0001-#{head_num}#{key_num + 1}0000&pf=#{stock}.jpg"
    elsif @trailing.to_i = 0
      return "#{ENV['BASE_URL']}/Image/Display?pd=webdata/catalogimages/STK_IMAGES/STK#{head_num}#{key_num - 2}0001-#{head_num}#{key_num}0000&pf=#{stock}.jpg"
    else
      return "#{ENV['BASE_URL']}/Image/Display?pd=webdata/catalogimages/STK_IMAGES/STK#{head_num}#{key_num}0001-#{head_num}#{key_num + 2}0000&pf=#{stock}.jpg"
    end
  end
end
