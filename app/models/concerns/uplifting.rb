module Concerns::Uplifting

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def generate_homing_string(item)
      "#{item.series_title}_#{item.special_number}_#{item.release_date.year}".parameterize
    end

    def get_attributes(source)
      self::ATTRIBUTES.map {|c| {c => source.method(c).call}}.reduce Hash.new, :merge
    end

    def same_records?(target_attrs, source_attrs)
      self::ATTRIBUTES.each do |attr|
        return false unless target_attrs[attr.to_s] == source_attrs[attr]
      end
    end

  end
end
