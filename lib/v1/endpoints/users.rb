module V1
  module Endpoints
    class Users < Grape::API
      resource :users do
        desc 'List all users.'
        get do
          present Models::User.all, with: Entities::User
        end
      end

    end
  end
end
