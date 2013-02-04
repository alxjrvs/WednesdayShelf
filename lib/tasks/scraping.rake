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

namespace :digest do

  desc "digest all the previews"
  task :previews => :environment do
    Preview.where(:digested => false).each do |preview|
      preview.digest
    end
  end
end

namespace :update do
  desc "Download comic Covers"
  task :covers => :environment do
    agent = LoginAgent.new.login.agent
    Issue.where(:has_cover => false).each do |i|
     i.download_cover
    end
    Variant.where(:has_cover => false).each do |i|
     i.download_cover
    end
  end

  desc "get updated shipping information"
  task :shipping => :environment do
    page = LoginAgent.new.login
    Release.all_future.each do |release|
      release.issues.each do |issue|
        issue.update_shipping
      end
    end
  end
end
