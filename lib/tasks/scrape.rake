namespace :scrape do
  desc "Download all comics"
  task :all => :environment do
    COMBINED_ARRAY.each do |url_array|
      master = FileDownloader.new(url_array[0]).file_body
      db = FileDownloader.new(url_array[1]).file_body
      PreviewsRecorder.new(SourceWeaver.new(master, db))
    end
  end

  desc "Download only from latest"
  task :latest => :environment do
    url_array = NEW_RELEASES_ARRAY.first
    master = filedownloader.new(url_array[0]).file_body
    db = filedownloader.new(url_array[1]).file_body
    previewsrecorder.new(sourceweaver.new(master, db))

  end
  desc "Download backlog"
  task :backlog => :environment do
    BACKLOG_ARRAY.each do |url_array|
      master = filedownloader.new(url_array[0]).file_body
      db = filedownloader.new(url_array[1]).file_body
      previewsrecorder.new(sourceweaver.new(master, db))
    end
  end
end
