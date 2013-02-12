class DateFormatter

  def initialize(date)
    @date = date
  end

  def format_date
    DateTime.strptime(@date, "%m/%d/%Y")
  end
end
