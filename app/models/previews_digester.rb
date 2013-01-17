class PreviewsDigester

  def initialize(previews)
    @previews = previews
    @name = "Alex Mother Loving Jarvis 12341234"
  end

  def digest
    @previews.listings.each do |listing|
      next unless listing.is_comic?
      ship_date = DateTime.strptime(listing.ship_date, "%m/%d/%Y")
      release = Release.where(:ship_date => ship_date).first_or_create
      create_hash = ListingCreateHasher.new(listing).digest
      if listing.full_title.include? @name
        VariantRecorder.new(listing).record
        next
      end
      @name = TitleStripper.new(listing.full_title).strip
      create_hash.merge!(:title => @name)
      issue = Issue.where(create_hash).first_or_create
      puts "-=+=- -=+=- -=+=-"
      puts "ISSUE RECORDED - #{issue.title}"
      puts "-=+=- -=+=- -=+=-"
      release.issues << issue
      next if listing.main_desc == nil
      series = Series.where(:name => listing.main_desc ).first_or_create
      series.issues << issue
      publisher = Publisher.where(:name => listing.publisher).first_or_create
      publisher.series << series
    end
    @previews.digested = true
    @previews.save
  end
end
