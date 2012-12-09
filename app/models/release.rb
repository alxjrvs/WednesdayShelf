class Release < ActiveRecord::Base

  has_many :issues
  has_many :series, :through => :issues, :uniq => true


  def issues_by_publisher_and_series
    return @issues_by_publisher_and_series if @issue_by_publisher_and_series.present?

    #collection = Hash.new([])
    collection = {}
    issues.order('title').each do |issue|
      next if issue.series.nil?
      collection[publisher] ||= {}
      collection[publisher][issue.series] ||= []
      collection[publisher][issue.series] << issue
    end
    @issues_by_publisher_and_series = collection
  end

  def issues_by_series
    return @issues_by_series if @issue_by_series.present?

    collection = {}
    issues.order('title').each do |issue|
      next if issue.series.nil?
      #collection[issue.series] ||= []
      collection[issue.series] = issue
    end
    @issues_by_series = collection
  end

  def self.all_future
    all.sort_by(&:ship_date).map do |release|
      release unless release.ship_date < Date.today
    end.compact
  end


  def find_and_organize(hash, name)
    pub = Publisher.where(:name => name).first
    organized_hash = {}
    organized_hash[pub.name] = hash[pub]
    hash.delete pub
    return organized_hash
  end
  #Organize the issues in the correct format for the view
  def organized_issues
    return @popular_comics if @popular_comics.present?
    issues_by_series = self.issues_by_series
    organized_hash = {}
    organized_hash.merge! find_and_organize(issues_by_series, "DC COMICS")
    organized_hash.merge! find_and_organize(issues_by_series, "MARVEL COMICS")
    organized_hash.merge! find_and_organize(issues_by_series, "IMAGE COMICS")
    organized_hash.merge! find_and_organize(issues_by_series, "IDW PUBLISHING")
    organized_hash.merge! find_and_organize(issues_by_series, "DARK HORSE COMICS")
    organized_hash["OTHER"]= {}
    issues_by_series.keys.each do |pub|
      organized_hash["OTHER"].merge! issues_by_series[pub]
    end
    @popular_comics = organized_hash
  end

  def self.next
    all_future[0]
  end
  def self.week_after
    all_future[1]
  end
  def self.two_weeks
    all_future[2]
  end
end

