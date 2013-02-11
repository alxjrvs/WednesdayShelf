namespace :update do
  desc "Download comic Covers"
  task :covers => :environment do
    Issue.where(:has_cover => false).each do |i|
     i.download_cover
    end
    Variant.where(:has_cover => false).each do |i|
     i.download_cover
    end
  end

  desc "get updated shipping information"
  task :shipping => :environment do
    Release.all_future.each do |release|
      release.issues.each do |issue|
        issue.update_shipping
      end
    end
  end
end
