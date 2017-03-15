$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), ".", "lib"))

require "rubygems"
require "bundler/setup"

Bundler.require :default

require File.expand_path('../config/initializers/devise', __FILE__)

require "api"

db_config = YAML.load_file(File.dirname(__FILE__) + '/db/config.yml')['development']
ActiveRecord::Base.establish_connection(db_config)

ActiveRecord::Base.logger = Logger.new STDOUT

# use ActionDispatch::Cookies
# use ActionDispatch::Session::CookieStore, key: '_kektus'
use Rack::Session::Cookie, secret: 'very secreto key'


use Warden::Manager do |warden|
  Devise.setup do |config|
    config.warden_config = warden
    config.pepper = 'pepper'
  end

  warden.failure_app = V1::FailureApp.new
end

run Root
