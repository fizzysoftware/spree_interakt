namespace :interakt do

  desc "Import your users data into interakt"
  task :import => :environment do
    begin
      SpreeInterakt::Import.start
    rescue => e
      puts e.message
    end
  end

end
