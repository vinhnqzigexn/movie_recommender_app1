namespace :import do
  desc "Import all"
  task :import_all => :environment do
    Movielen.insert_all
  end

  desc "Training"
  task :recommender_train => :environment do
    Recommender.new.train_recommend
  end

end
