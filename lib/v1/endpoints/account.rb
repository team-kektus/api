module V1
  module Endpoints
    class Account < Grape::API
      before &:authenticate!

      resource :account do
        get do
          present current_user, with: Entities::User
        end
      end

    end
  end
end
