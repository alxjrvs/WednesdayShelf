namespace :digest do

  desc "digest all the previews"
  task :previews => :environment do
    Preview.where(:digested => false).each do |preview|
      preview.digest
    end
  end
end
