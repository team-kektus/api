module V1
  class Mounts < Grape::API
    version 'v1', using: :path
    format :json
    content_type :json, 'application/json;charset=UTF-8'

    if ENV['RACK_ENV'] == 'development'
      rescue_from :all, backtrace: true
    end

    helpers V1::Helpers

    mount V1::Endpoints::Auth
    mount V1::Endpoints::Account
    mount V1::Endpoints::Users
    mount V1::Endpoints::Teams
    mount V1::Endpoints::GradingAspects
  end
end
