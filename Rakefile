require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


require "active_record_migrations"
ActiveRecordMigrations.load_tasks

require "bundler/setup"
Bundler.require :default

namespace :grape do
  desc 'Print compiled grape routes'
  task :routes do
    Root.routes.each do |route|
      puts route.path
    end
  end
end
