require_relative '../support/source_weaver/expectations.rb'
FactoryGirl.define do
  factory :previews_recorder do
    ignore do
      preview_hash SW_DIGEST_EXPECTED
    end
    initialize_with {PreviewsRecorder.new(preview_hash)}
  end
end
