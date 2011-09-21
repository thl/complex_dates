namespace :complex_dates do
  desc "Syncronize extra files for Complex Dates."
  task :sync do
    system "rsync -ruv --exclude '.*' vendor/plugins/complex_dates/db/migrate db"
    system "rsync -ruv --exclude '.*' vendor/plugins/complex_dates/public ."
  end
end