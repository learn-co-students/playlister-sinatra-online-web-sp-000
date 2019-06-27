ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end

task :resetdb do
  Rake::Task['db:rollback'].invoke
  Rake::Task['db:rollback'].reenable
  Rake::Task['db:rollback'].invoke
  Rake::Task['db:rollback'].reenable
  Rake::Task['db:rollback'].invoke
  Rake::Task['db:rollback'].reenable
  Rake::Task['db:rollback'].invoke
  Rake::Task['db:rollback'].reenable
  Rake::Task['db:migrate'].invoke
  Rake::Task['db:seed'].invoke
end
