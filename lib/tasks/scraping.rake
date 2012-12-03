namespace :scrape
desc "Download all comics"
task :all => :environment do
  scraper = Scrape.new
  scraper.backlog_scrape
  scraper.total_scrape
  scraper.download_all_covers
end
