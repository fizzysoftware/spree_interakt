namespace :interakt do

  desc "Start Integration with interakt"
  task :start => :environment do
    begin
      SpreeInterakt::Import.start
    rescue => e
      puts e.message
    end
  end

end
