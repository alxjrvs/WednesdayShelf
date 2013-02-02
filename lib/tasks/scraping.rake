namespace :scrape do
  desc "Download all comics"
  task :all => :environment do
    PreviewsRecorder.new(HashesToSymConverter.new(NewReleasesLogger.new.digest).rebrand).record
    BACKLOG_ARRAY.each do |log|
      PreviewsRecorder.new(HashesToSymConverter.new(PreviewsBacklogger.new(log).digest).rebrand).record
    end
  end

  desc "Download only from latest"
  task :latest => :environment do
    PreviewsRecorder.new(HashesToSymConverter.new(NewReleasesLogger.new.digest).rebrand).record
  end
  desc "Download backlog"
  task :backlog => :environment do
    BACKLOG_ARRAY.each do |log|
      PreviewsRecorder.new(HashesToSymConverter.new(PreviewsBacklogger.new(log).digest).rebrand).record
    end
  end
end

namespace :digest do

  desc "digest all the previews"
  task :previews => :environment do
    digester = Digester.new
    Preview.where(:digested => false).each do |preview|
    #Preview.all.each do |preview|
      digester.digest(preview)
    end
  end
  desc "Download comic Covers"
  task :covers => :environment do
    digester = Digester.new
    digester.download_all_covers
  end
  desc "get updated shipping information"
  task :shipping => :environment do
    digester = Digester.new
    digester.update_shipping
  end
end
