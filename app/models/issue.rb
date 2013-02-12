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
    login = MASTER_LOGIN
    url = IssueUrlMaker.new(self.diamond_no).get_url
    html = login.agent.get(url).body
    doc = Nokogiri::HTML(html)
    cancel_check = IssueCancelChecker.new(doc, self)
    puts "Updating shipping for #{self.title}"
    return nil if cancel_check.check_for_not_found
    return nil if cancel_check.check_for_cancelled
    self.release = Release.where(:ship_date => ShippingRowUpdater.new(doc).format_date).first_or_create
    self.save
    puts "Updated Shipping for #{self.title}"
  end

  def download_cover
    IssueImageDownloader.new(self, MASTER_LOGIN.agent).download_to_issue
  end
end
