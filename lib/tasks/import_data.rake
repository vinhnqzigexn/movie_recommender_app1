namespace :import do
  desc "TODO"
  task :import_users => :environment do
    debugger
  end

  desc "TODO"
  task :import_movies => :environment do
  end

  desc "Import all"
  task :import_all => :environment do
    Movielen.insert_all
  end

end
