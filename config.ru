$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), ".", "lib"))

require "rubygems"
require "bundler/setup"

Bundler.require :default

require "api"

require File.expand_path('../config/config', __FILE__)

db_config = YAML.load_file(File.dirname(__FILE__) + '/db/config.yml')['development']
ActiveRecord::Base.establish_connection(db_config)

ActiveRecord::Base.logger = Logger.new STDOUT


use Rack::Session::Cookie, secret: Config.secret_key


use Warden::Manager do |manager|
  manager.failure_app = V1::Auth::FailureApp.new
  manager.default_strategies :password

  manager.serialize_into_session do |user|
    user.id
  end

  manager.serialize_from_session do |id|
    Models::User.find(id)
  end
end

Warden::Strategies.add(:password, V1::Auth::PasswordStrategy)

run Root
