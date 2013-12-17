class CategorySorter

  ISSUE_CODE = 1
  COLLECTION_CODE = 3
  MERCHANDISE_CODES = [2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

  attr_reader :hash

  def initialize(hash)
    @hash = hash
  end

  def sort
    return hash[:category_code] unless hash[:category_code].nil?
    return ISSUE_CODE if is_variant?
    return COLLECTION_CODE if is_collection?
    return "16" if is_merch?
    return ISSUE_CODE if is_issue?
  end

  def is_variant?
    return @is_variant unless @is_variant.nil?
    @is_variant = true if hash[:title].include? "VAR ED"
    @is_variant = true if hash[:title].include? "COMBO PACK"
    @is_variant = true if hash[:title].include? "STANDARD ED"
    @is_variant = true if hash[:title].match(/(CVR)\s[B-Z]/)
    @is_variant = true if specific_issue_patterns(hash[:title])
    @is_variant = false if @is_variant.nil?
    return @is_variant
  end

  def is_issue?
    @_is_issue ||=
    if specific_issue_patterns(hash[:title])
      true
    elsif is_variant?
      false
    elsif is_collection?
      false
    elsif is_merch?
      false
    else
      true
    end
  end

  def is_collection?
    @_is_collection ||=
      if hash[:title].include?(" GN ")
        true
      elsif hash[:title].include?(" TP ")
      true
      elsif hash[:title].match(/\s(VOL)\s\d+/)
        true
      elsif hash[:title].match(/\s[#]\d+/)
        false
      else
        false
      end
  end

  def is_merch?
    return @is_merch unless @is_merch.nil?
    case hash[:creators]
    when ""
      @is_merch = true
    else
      @is_merch = false
    end
    return @is_merch
  end

  private

  def strict_issue_title_matcher(title)
    /^(#{title})\s[#]/
  end

  def specific_issue_patterns(title)
    title.match(/(CVR)\s[A]/) ||
      title.match(strict_issue_title_matcher("RED SONJA")) ||
      title.match(strict_issue_title_matcher("VAMPIRELLA")) ||
      title.match(strict_issue_title_matcher("ARMY OF DARKNESS VS HACK SLASH")) ||
      split_issue_patterns(title)
  end

  def split_issue_patterns(title)
    return nil unless title.split("#")[1]
    title.split("#")[1].match(/\d\D+(PTG)/) ||
    title.split('#')[1].match(/(REORDER ED)/) ||
    title.split('#')[1].match(/(SKETCH ED)/) ||
    title.split('#')[1].match(/(BLANK CVR)/) ||
    title.split('#')[1].match(/(FOIL CVR)/) ||
    title.split("#")[1].include?("VAR INCENTIVE CVR") ||
    title.split("#")[1].include?("DIRECT MARKET CVR") ||
    title.split("#")[1].include?("MAIN CVRS")
  end
end
