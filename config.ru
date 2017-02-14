$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), ".", "lib"))

require "rubygems"
require "bundler/setup"

Bundler.require :default

require "api"

db_config = YAML.load_file(File.dirname(__FILE__) + '/db/config.yml')['development']
ActiveRecord::Base.establish_connection(db_config)

run Root
