namespace :digest do

  task issues: :environment do
    DiamondItem.valid.each do |diamond_item|
      puts diamond_item.diamond_number
      IssueUplifter.uplift!(diamond_item) if diamond_item.is_issue?
    end
  end
end
