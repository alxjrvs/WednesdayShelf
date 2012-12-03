desc "Download all comics"
task :download_issues => :environment do
  Scrape.new.total_scrape
end
