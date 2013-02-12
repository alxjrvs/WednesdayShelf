require_relative '../support/source_weaver/expectations.rb'
describe SourceWeaver do
  before :each do
    @source_weaver = build(:source_weaver)
  end
  #it "fills_in_a_proper_blurb" do
    #unsure
  #end
  it "digests into hash" do
    @source_weaver.digest.should eq(SW_DIGEST_EXPECTED)
  end
end
