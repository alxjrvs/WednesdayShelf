Devise.setup do |config|
  config.secret_key = 'd10b0c7ec07e312624d652216373768153eb31837b5e7505bc360a18889a7761ebd58864839f8854a23a7bc14167156b893694d4b7effb43f2c835cb4b4abc05'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email, :username ]
  config.sign_out_via = :get
end
