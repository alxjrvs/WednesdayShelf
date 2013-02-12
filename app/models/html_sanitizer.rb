class HTMLSanitizer

  def initialize(html)
    @html = html
  end

  def sanitize
    if @html.scan('</body>').size > 1
      (@html.scan('</body>').size - 1).times do
        @html = @html.sub('</body>', '')
      end
    end
    return @html
  end
end
