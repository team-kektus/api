module V1
  module Endpoints
    class Users < Grape::API
      resource :users do
        desc 'List all users.'
        get do
          present Models::User.all, with: Entities::User
        end

        desc 'Create new user.'
        params do
          requires :email, type: String, desc: "Username"
          requires :password, type: String, desc: "Password"
        end
        post do
          user = Models::User.create!(allowed_params(params))
          present user, with: Entities::User
        end
      end


      helpers do
        def allowed_params(params)
          ActionController::Parameters.new(params).permit(
            :email,
            :password,
          )
        end
      end
    end
  end
end
