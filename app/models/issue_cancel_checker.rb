class IssueCancelChecker

  def initialize(doc, issue)
    @doc = doc
    @issue = issue
  end

  def check_for_string(string)
    if @doc.search("[text()*=\"#{string}\"]").empty? == false
      puts "=+=+=+=+=+=+=+=+=+=+=+"
      puts "#{@issue.title} AND ALL VARIANTS CANCELLED "
      puts "=+=+=+=+=+=+=+=+=+=+=+"
      @issue.variants.destroy_all
      @issue.destroy
      return true
    else
      return false
    end
  end

  def check_for_not_found
    puts "testing for not_found"
    check_for_string("could not be found or is currently not in stock.")
  end

  def check_for_cancelled
    puts "testing for cancelled"
    check_for_string("CANCELLED")
  end
end
