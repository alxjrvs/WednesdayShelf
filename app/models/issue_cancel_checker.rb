class IssueCancelChecker

  def initialize(doc)
    @doc = doc
  end

  def check_for_string(string)
    if @doc.search("[text()*= #{string}]").empty? == false
      issue.variants.destroy_all
      issue.destroy
      puts "GONE"
      return true
    else
      return false
    end
  end
  def check_for_not_found
    check_for_string('could not be found or is currently not in stock.')
  end

  def check_for_cancelled
    check_for_string('CANCELLED')
  end
end
