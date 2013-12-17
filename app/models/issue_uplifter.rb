class IssueUplifter
  include Concerns::Uplifting

  def self.uplift!(item)
    issue = generate_issue(item)
    find_covers(issue)
  end

  private

  def self.series(item)
    Series.where(title: item.series_title, publisher: publisher(item)).first_or_create
  end

  def self.publisher(item)
    Publisher.where(name: item.publisher).first_or_create
  end

  def self.release(item)
    Release.where(date: item.release_date).first_or_create
  end

  def self.generate_issue(item)
    iss = Issue.where(diamond_number: item.diamond_number).first_or_create.tap do |issue|
      issue.raw_title = item.raw_title
      issue.stock_number = item.stock_number
      issue.diamond_number = item.diamond_number
      issue.homing_string = generate_homing_string(item)
      issue.description = item.description
      issue.price = item.price
      issue.title = item.title
      issue.special_issue_number = item.special_number
      issue.issue_number = item.issue_number
      issue.max_issue = item.limited_series_max_issue
      issue.author = item.author
      issue.artist = item.artist
      issue.series = series(item)
      issue.release = release(item)
    end
    puts "Recorded Issue for #{iss.diamond_number}, Title: #{iss.raw_title}" if iss.save
    iss
  end

  def self.find_covers(issue)
    Cover.where(
      homing_string: issue.homing_string,
    ).each {|c| c.update_attributes(issue: issue)}
  end
end
