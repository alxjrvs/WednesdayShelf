class IssueUplifter
  include Concerns::Uplifting

  def self.uplift!(item)
    publisher = Publisher.where(name: item.publisher).first_or_create
    series = Series.where(title: item.series_title, publisher: publisher).first_or_create
    release = Release.where(date: item.release_date).first_or_create

    homing_string = generate_homing_string(item)
    generate_issue(item, series, release, homing_string)

  end

  private

  def self.generate_cover(item, homing_string, issue)
    Cover.where(diamond_number: item.diamond_number).first_or_create do |c|
      c.homing_string= homing_string
      c.image= item.image
      c.issue= issue
      c.cover_artist= item.cover_artist
    end
  end

  def self.generate_issue(item, series, release, homing_string)
    Issue.where(diamond_number: item.diamond_number).first_or_create do |issue|
      issue.raw_title = item.raw_title
      issue.stock_number = item.stock_number
      issue.diamond_number = item.diamond_number
      issue.homing_string = homing_string
      issue.description = item.description
      issue.price = item.price
      issue.title = item.title
      issue.special_issue_number = item.special_number
      issue.issue_number = item.issue_number
      issue.max_issue = item.limited_series_max_issue
      issue.author = item.author
      issue.artist = item.artist
      issue.series = series
      issue.release = release
    end
  end

  def self.find_variants(uplifted_issue)
    covers = Cover.where(
      homing_string: uplifted_issue.homing_string,
      hero_cover: false
    )
    covers.each {|c| c.update_attributes(issue: uplifted_issue)} if covers
  end
end
