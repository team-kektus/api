module V1
  class Mounts < Grape::API
    version 'v1', using: :path
    format :json
    content_type :json, 'application/json;charset=UTF-8'

    mount V1::Endpoints::Users
    mount V1::Endpoints::Teams
  end
end
