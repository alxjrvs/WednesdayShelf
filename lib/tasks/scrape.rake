namespace :scrape do
  desc "Download all comics"
  task :all => :environment do
    COMBINED_ARRAY.each do |url_array|
      puts url_array[0]
      login = LoginAgent.new.login
      master = FileDownloader.new(url_array[0], login).file_body
      db = FileDownloader.new(url_array[1], login).file_body
      PreviewsRecorder.new(SourceWeaver.new(master, db).weave).record
    end
  end

  desc "Download only from latest"
  task :latest => :environment do
    url_array = NEW_RELEASE_ARRAY.first
    login = LoginAgent.new.login
    master = FileDownloader.new(url_array[0], login).file_body
    db = FileDownloader.new(url_array[1], login).file_body
    PreviewsRecorder.new(SourceWeaver.new(master, db).weave).record
  end
  desc "Download backlog"
  task :backlog => :environment do
    BACKLOG_ARRAY.each do |url_array|
      login = LoginAgent.new.login
      master = FileDownloader.new(url_array[0]).file_body
      db = FileDownloader.new(url_array[1]).file_body
      PreviewsRecorder.new(SourceWeaver.new(master, db).weave).record
    end
  end
end
