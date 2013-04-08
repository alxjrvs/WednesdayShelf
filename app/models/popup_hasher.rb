class PopupHasher

  attr_reader :agent, :diamond_code
  def initialize(diamond_code, agent)
    @agent = agent
    @diamond_code = diamond_code
  end

  def get_url
    @_get_url ||= "#{BASE_URL + FANCYBOX_URL}#{diamd_no}".gsub("\n", "")
  end

  def sanitize_html
    @sanitize_html ||= HTMLSanitizer.new(@agent.get(get_url).content).sanitize
  end

  def get_html
    @get_html ||= Nokogiri::HTML(sanitize_html)
  end

  def to_hash
   get_html.css('.LookupItemData_Item').map do |l| 
      Hash[l.css('.LookupItemData_Label').text.strip => l.css('.LookupItemData_Value').text.strip]
    end.reduce Hash.new, :merge
  end
end
