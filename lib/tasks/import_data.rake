namespace :import do
  desc "Import all"
  task :import_all => :environment do
    Movielen.insert_all
  end

end
