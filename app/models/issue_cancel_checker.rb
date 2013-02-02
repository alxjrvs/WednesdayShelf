class IssueCancelChecker

  def initialize(doc)
    @doc = doc
  end

  def check_for_not_found
    if @doc.search("[text()*='could not be found or is currently not in stock.']").empty? == false
      issue.variants.destroy_all
      issue.destroy
      puts "GONE"
      return true
    else
      return false
    end
  end

  def check_for_cancelled
    if @doc.search("[text()*='CANCELLED']").empty?  == false
      issue.variants.destroy_all
      issue.destroy
      puts "CANCELLED"
      return true
    else
      return false
    end
  end
end
