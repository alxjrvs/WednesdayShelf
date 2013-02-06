namespace :scrape do
  desc "Download all comics"
  task :all => :environment do
    PreviewsRecorder.new(NewReleasesLogger.new.digest).record
    BACKLOG_ARRAY.each do |log|
      PreviewsRecorder.new(PreviewsBacklogger.new(log).digest).record
    end
  end

  desc "Download only from latest"
  task :latest => :environment do
    PreviewsRecorder.new(NewReleasesLogger.new.digest).record
  end
  desc "Download backlog"
  task :backlog => :environment do
    BACKLOG_ARRAY.each do |log|
      PreviewsRecorder.new(PreviewsBacklogger.new(log).digest).record
    end
  end
end
