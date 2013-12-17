class CoverUplifter
  include Concerns::Uplifting

  def self.uplift!(item, image)
    cover = generate_cover(item, image)
    find_issue(cover)
  end

  private

  def self.generate_cover(item, image)
    cover = Cover.where(diamond_number: item.diamond_number).first_or_create.tap do |c|
      c.homing_string = generate_homing_string(item)
      c.image = image
      c.cover_artist= item.cover_artist
    end
    puts "Recorded Cover for #{item.diamond_number}" if cover.save
    cover
  end

  def self.find_issue(cover)
    issue = Issue.where(homing_string: cover.homing_string).first
    cover.update_attributes(issue: issue) unless issue.nil?
  end
end
