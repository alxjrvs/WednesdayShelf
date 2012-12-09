class Issue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :variants
  belongs_to :series
  belongs_to :release

  #has_attached_file :cover,
      #styles: {
        #:small => "150x230>",
        #:medium => "300x460>"
        #},
      #:s3_credentials => {
        #:bucket => ENV['AWS_BUCKET'],
        #secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        #access_key_id: ENV['AWS_ACCESS_KEY_ID']
      #},
      #:storage => :aws,
      #:s3_bucket =>ENV['AWS_BUCKET'],
      ##:s3_host_alias => self.s3_config['s3_host_alias'],
      #:s3_permissions => :public_read,
      #:s3_protocol => 'http',
      #:s3_options => {
        #:storage_class => :reduced_redundancy,
      #}
      #:path => "company_documents/:id/:style/:data_file_name"
end
