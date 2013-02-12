class PopupHasher

  def initialize(diamond_code)
    @login = MASTER_LOGIN
    @diamond_code = diamond_code
  end

  def get_url
    IssueUrlMaker.new(@diamond_code).get_url
  end

  def get_html
    Nokogiri::HTML(@login.agent.get(get_url).body)
  end

  def to_hash
   get_html.css('.LookupItemData_Item').map do |l| 
      Hash[l.css('.LookupItemData_Label').text.strip => l.css('.LookupItemData_Value').text.strip]
    end.reduce Hash.new, :merge
  end
end
