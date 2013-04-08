namespace :update do
  desc "Download comic Covers"
  task :covers => :environment do
    agent = LoginAgent.new.login
    Issue.where(:has_cover => false).each do |i|
     i.download_cover(agent)
    end
    agent = LoginAgent.new.login
    Variant.where(:has_cover => false).each do |i|
     i.download_cover(agent)
    end
  end

  desc "get updated shipping information for future releases"
  task :shipping => :environment do
    Release.all_future.each do |release|
      agent = LoginAgent.new.login
      release.issues.each do |issue|
        issue.update_shipping(agent)
      end
    end
  end
end
