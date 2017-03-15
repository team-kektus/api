module V1
  module Endpoints
    class Auth < Grape::API
      resource :auth do
        desc 'Login with a user'
        params do
          requires :email, type: String, desc: 'Username'
          requires :password, type: String, desc: 'Password'
        end
        post do
          login_params = allowed_params(params)

          user = Models::User.find_for_database_authentication(:login => login_params[:email])
          error!('Error with your email or password', 401) unless user

          if user.valid_password?(login_params[:password])
            sign_in('user', user)
            present user, with: Entities::User
          else
            error! 'Unauthorized', 401
          end
        end
      end

      helpers do
        include Devise::Controllers::Helpers

        def allowed_params(params)
          ActionController::Parameters.new(params).permit(
            :email,
            :password
          )
        end

      end
    end
  end
end
