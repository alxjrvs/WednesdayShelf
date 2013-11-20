class CoverUplifter
  include Concerns::Uplifting

  def self.uplift!(item)
    homing_string = generate_homing_string(item)
    generate_cover(item, homing_string)
  end

  private

  def self.generate_cover(item, homing_string)
    Cover.where(diamond_number: item.diamond_number).first_or_create do |c|
      c.homing_string= homing_string
      c.image = item.image
      c.issue= found_issue(homing_string)
      c.cover_artist= item.cover_artist
    end
  end

  def self.found_issue(homing_string)
    Issue.where(homing_string: homing_string).first
  end

end
