class DiamondItem < ActiveRecord::Base
  has_one :cover

  module ProductTypes
    ISSUE_CODE = 'issue',
    VARIANT_CODE = 'variant',
    COLLECTION_CODE = 'collection',
    MERCHANDISE_CODE = 'merchandise'
  end

  def product_type?
    return ProductTypes::ISSUE_CODE if is_issue?
    return ProductTypes::VARIANT_CODE if is_variant?
    return ProductTypes::COLLECTION_CODE if is_collection?
    return ProductTypes::MERCHANDISE_CODE if is_merch?
  end

  def author
    @_author ||= creators_hash["W"]
  end

  def artist
    @_artist ||= creators_hash["A"]
  end

  def cover_artist
    @_cover_artist ||= creators_hash["CA"]
  end

  def series_title
    @_series_title ||= title_formatter.series_title || title
  end

  def title
    @_title ||= title_formatter.clean_title
  end

  def special_number
    @_special_number ||= title_formatter.special_number
  end

  def issue_number
    @issue_number ||= title_formatter.issue_number
  end

  def limited_series_max_issue
    @_limited_series_max_issue ||= title_formatter.limited_series_max_issue
  end

  def variant_description
    @_variant_description ||= title_formatter.variant_description
  end

  private

  def creators_hash
    return @_creators_hash if @_creators_hash.present?
    @_creators_hash ||=
    array = creators.split('(').map {|x| x.split(')')}.flatten.map {|x| x.strip}
    hash ={}
    array.each_with_index do |val, i|
      if i.even? || i == 0
        if val.include? '/'
          val.split('/').each_with_index do |key, index|
            instance_variable_set("@key#{index + 1}".to_sym, key)
          end
        else
          @key = val
        end
      elsif i.odd?
        @value = val
        hash.merge! @key => @value if @key
        hash.merge! @key1 => @value if @key1
        hash.merge! @key2 => @value if @key2
        hash.merge! @key3 => @value if @key3
        @value = nil
        @key = nil
        @key1= nil
        @key2 = nil
        @key3 = nil
      end
    end
    @_creators_hash = hash
    return @_creators_hash
  end

  def title_formatter
    @_formatted_title ||= TitleFormatter.new(raw_title)
  end

  def is_collection?
    @_is_collection ||= CategorySorter::COLLECTION_CODE  == category_code
  end

  def is_merch?
    @_is_merch ||= CategorySorter::MERCHANDISE_CODES.include? category_code
  end

  def is_issue?
    @_is_issue ||=
      category_code == CategorySorter::ISSUE_CODE && category_sorter.is_issue?
  end

  def category_sorter
    @_category_sorter ||= CategorySorter.new({title: title, category_code: category_code  })
  end

  def is_variant?
    @_is_variant ||= category_code == CategorySorter::ISSUE_CODE && category_sorter.is_variant?
  end
end
