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

  def update_shipping(agent = LoginAgent.new.login)
    IssueUpdater.new(self, agent).update
  end

  def download_cover(agent = LoginAgent.new.login)
    IssueImageDownloader.new(self, agent).download_to_issue
    puts "testing for cancelled"
  end
end
