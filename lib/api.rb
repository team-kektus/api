# module Api
#   # Your code goes here...
# end

# Automatically loads all files in lib folder.
require 'active_support/dependencies'
ActiveSupport::Dependencies.autoload_paths << File.expand_path('./lib')

class Root < Grape::API
  mount Example::Mounts
  mount V1::Mounts
end
