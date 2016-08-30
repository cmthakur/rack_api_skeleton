namespace :db do
  task :seed do
    filename = "#{FileUtils.pwd}/seed.rb"
    task_name = File.basename(filename, '.rb').intern
    load(filename) if File.exist?(filename)
  end
end