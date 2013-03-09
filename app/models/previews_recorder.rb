class PreviewsRecorder
  attr_reader :preview_hash, :preview
  def initialize(preview_hash)
    @preview_hash = preview_hash
    @preview = Preview.create
  end

  def rebrand_hash
    #something relating to Preview hash rebrander
  end
  def record
    preview_hash.each_with_index do |listing|
      ListingRecorder.new(listing, preview).record
    end
  end
end
