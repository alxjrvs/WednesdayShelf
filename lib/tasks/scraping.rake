namespace :scrape do
  desc "Download all comics"
  task :all => :environment do
    scraper = Scraper.new
    scraper.get_backlog
    scraper.get_previews
  end

  desc "Download only from latest"
  task :latest => :environment do
    scraper = Scraper.new
    scraper.get_previews
  end
  desc "Download backlog"
  task :backlog => :environment do
    scraper = Scraper.new
    scraper.get_backlog
  end
  desc "Download comic Covers"
  task :covers => :environment do
  end

  desc "Download the Latest of the latest"
  task :new => :environment do
  end
  desc "Download the Latest previews"
  task :previews => :environment do
  end

  desc "Download the backlog"
  task :backlog => :environment do
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
end
