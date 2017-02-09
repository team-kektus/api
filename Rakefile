require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


require "active_record_migrations"
ActiveRecordMigrations.load_tasks
