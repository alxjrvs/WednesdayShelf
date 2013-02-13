require_relative '../support/source_weaver/expectations.rb'
FactoryGirl.define do
  factory :hashes_to_sym_converter do
    ignore do
      preview_hash SW_DIGEST_EXPECTED
    end
    initialize_with {HashesToSymConverter.new(preview_hash)}
  end
end
