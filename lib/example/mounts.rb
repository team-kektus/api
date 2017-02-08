module Example
  class Mounts < Grape::API
    version 'example', using: :path
    format :json
    content_type :json, 'application/json;charset=UTF-8'

    mount Example::Endpoints::Users
  end
end
