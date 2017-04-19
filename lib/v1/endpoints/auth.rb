module V1
  module Endpoints
    class Auth < Grape::API
      resource :auth do
        desc 'Login with a user'
        params do
          requires :email, type: String, desc: 'Email'
          requires :password, type: String, desc: 'Password'
        end
        post do
          login_params = allowed_params(params)
          user = Models::User.find_by(email: login_params[:email])

          error!('Error with your email or password', 401) unless user

          if user.valid_password?(login_params[:password])
            warden.set_user(user, :scope => :user)
            present user, with: Entities::User
          else
            error! 'Unauthorized', 401
          end
        end

        get 'logout' do
          warden.logout(:user)
          present 'true'
        end



        namespace 'social' do
          params do
            requires :provider, type: String
            requires :access_token, type: String
          end
          post do
            permitted_params = allowed_social_params(params)
            user = Models::User.find_by_social_backend(permitted_params[:provider], permitted_params[:access_token])

            if user.present?
              warden.set_user(user, :scope => :user)
              present user, with: Entities::User
            else
              error! 'Problem with social auth', 401
            end
          end
        end


      end

      helpers do
        def allowed_params(params)
          ActionController::Parameters.new(params).permit(
            :email,
            :password
          )
        end

        def allowed_social_params(params)
          ActionController::Parameters.new(params).permit(
            :provider,
            :access_token
          )
        end
      end
    end
  end
end
