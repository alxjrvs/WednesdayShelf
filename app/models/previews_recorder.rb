class PreviewsRecorder
  def initialize(preview_hash)
    @preview_hash = preview_hash
    @p = Preview.create
  end

  def state_recorded
    if @p.last_diamd_no
      puts "Previews Recorded, Range: #{@p.first_diamd_no} - #{@p.last_diamd_no}"
    else
      puts "Preview incomplete."
    end
  end

  def record
    @preview_hash.each_with_index do |listing, i|
      if i == 0
        @p.first_diamd_no = listing[:diamd_no]
        @p.save
      end
      ListingRecorder.new(listing, @p).record
      if i == @preview_hash.size - 1
        @p.last_diamd_no = listing[:diamd_no]
        @p.save
      end
    end
    state_recorded
  end
end