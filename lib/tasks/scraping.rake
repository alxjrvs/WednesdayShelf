namespace :scrape do
  desc "Download all comics"
  task :all => :environment do
    scraper = Scrape.new
    scraper.backlog_scrape
    scraper.total_scrape
  end

  desc "Download comic Covers"
  task :covers => :environment do
    scraper = Scrape.new
    scraper.download_all_covers
  end

  desc "Download the Latest of the latest"
  task :new => :environment do
    scraper = Scrape.new
    scraper.store_in_database scraper.get_new
    scraper.store_in_database scraper.get_upcoming
    scraper.store_in_database scraper.get_two_weeks
  end
  desc "Download the Latest previews"
  task :previews => :environment do
    scraper = Scrape.new
    scraper.store_in_database scraper.get_previews
  end

  desc "Download the backlog"
  task :backlog => :environment do
    scraper = Scrape.new
    scraper.backlog_scrape
  end
end
