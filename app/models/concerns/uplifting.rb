module Concerns::Uplifting

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def generate_homing_string(item)
      "#{item.series_title}_#{item.special_number}_#{item.release_year}".parameterize
    end
  end
end
