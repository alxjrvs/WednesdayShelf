require 'spec_helper'
require_relative '../support/db_hasher/expectations.rb'

describe DBHasher do
  before :each do
    @db_hasher = build(:db_hasher)
  end
end
