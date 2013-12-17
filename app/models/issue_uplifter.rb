class IssueUplifter
  include Concerns::Uplifting

  ATTRIBUTES = :raw_title, :stock_number, :diamond_number, :description, :price, :title, :special_issue_number, :issue_number, :max_issue, :author, :artist

  def self.uplift!(source)
    issue = generate_issue(source)
    find_covers(issue)
  end

  private

  def self.series(source)
    Series.where(title: source.series_title, publisher: publisher(source)).first_or_create
  end

  def self.publisher(source)
    Publisher.where(name: source.publisher).first_or_create
  end

  def self.release(source)
    Release.where(date: source.release_date).first_or_create
  end

  def self.generate_issue(source)
    new_issue = Issue.where(diamond_number: source.diamond_number).first_or_initialize
    unless same_records?(new_issue.attributes, get_attributes(source))
      new_issue.attributes = get_attributes(source)
      new_issue.series = series(source)
      new_issue.release = release(source)
      new_issue.homing_string = generate_homing_string(source)
      new_issue.save
    end
    puts "Recorded Issue for #{new_issue.diamond_number}, Title: #{new_issue.raw_title}"
    new_issue
  end

  def self.find_covers(issue)
    Cover.where(
      homing_string: issue.homing_string,
    ).each {|c| c.update_attributes(issue: issue)}
  end
end
