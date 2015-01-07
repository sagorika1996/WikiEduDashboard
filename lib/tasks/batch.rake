namespace :batch do

  desc 'Hourly data updates'
  task :update_hourly => :environment do
    Rake::Task["user:update_users"].invoke
    Rake::Task["revision:update_revisions"].invoke
    Rake::Task["cache:update_caches"].invoke
  end

  desc 'Daily data updates'
  task :update_daily => :environment do
    #Rake::Task["course:update_courses"].invoke
    Rake::Task["user:update_users"].invoke
    Rake::Task["revision:update_revisions"].invoke
    Rake::Task["article:update_views"].invoke
    Rake::Task["cache:update_caches"].invoke
  end

  desc 'Initialize the database from scratch'
  task :initialize => :environment do
    Rake::Task["course:update_courses"].invoke
    Rake::Task["user:update_users"].invoke
    Rake::Task["revision:update_revisions"].invoke
    Rake::Task["article:update_views_all_time"].invoke
    Rake::Task["cache:update_caches"].invoke
  end

end