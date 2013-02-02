class Preview < ActiveRecord::Base
  has_many :listings

  def digest
    PreviewsDigester.new(self).digest
  end
end
