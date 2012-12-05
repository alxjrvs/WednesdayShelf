class Release < ActiveRecord::Base

  has_many :issues
  has_many :series, :through => :issues, :uniq => true


  def issues_by_series
    return @issues_by_series if @issue_by_series.present?

    #collection = Hash.new([])
    collection = {}
    issues.where(:is_comic => true).order('title').each do |issue|
      next if issue.series.nil?
      publisher = issue.series.publisher
      collection[publisher] ||= {}
      collection[publisher][issue.series] ||= []
      collection[publisher][issue.series] << issue
    end
    @issues_by_series = collection
  end
  def self.all_future
    all.sort_by(&:ship_date).map do |release|
      release unless release.ship_date < Date.today
    end.compact
  end

  #def popular_comics
    #return @popular_comics if @popular_comics.present?
    #issues = self.issues_by_series
    #organized_hash = {}
    #issues.keys.each do |publisher|
      #case publisher.title
      #when "DC COMICS"
        #organized_hash["DC COMICS"] = issues[publisher]
      #when "DC COMICS"
        #organized_hash["DC COMICS"] = issues[publisher]
      #when "DC COMICS"
        #organized_hash["DC COMICS"] = issues[publisher]
      #when "DC COMICS"
        #organized_hash["DC COMICS"] = issues[publisher]
      #when "DC COMICS"
        #organized_hash["DC COMICS"] = issues[publisher]
      #end
    #end
  #end

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

