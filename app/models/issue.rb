class Issue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :variants
  belongs_to :series
  belongs_to :release

  has_attached_file :cover,
      styles: {
        :small => ["150x230", :png],
        :medium => ["300x460", :png]
        }
    #:url => "/system/assets/images/:class:attachment/:id_partition/:style/:basename.:extension",
    #:path => "app/assets/images/:class/:attachment/:id_partition/:style/:basename.:extension"

  def update_shipping
    @agent = LoginAgent.new.agent
    url = IssueUrlMaker.new(self.diamond_no).get_url
    html = @agent.get(url).body
    doc = Nokogiri::HTML(html)
    cancel_check = IssueCancelChecker.new(doc)
    return nil if cancel_check.check_for_not_found
    return nil if cancel_check.check_for_cancelled
    self.release = Release.where(:ship_date => ShippingRowFinder.new(doc).format_date).first_or_create
    self.save
  end

  def download_cover
    IssueImageDownloader.new(self, LoginAgent.new.login.agent)
  end
end
