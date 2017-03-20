module V1
  module Endpoints
    class Account < Grape::API
      before &:authenticate!

      resource :account do
        get do
          present current_user, with: Entities::User
        end

        desc 'Change user data.'
        params do
          requires :email, type: String, desc: "Email"
        end
        put do
          permitted_params = allowed_params(params)
          user = Models::User.find_by(email: permitted_params.delete(:email))
          user.update_attributes(permitted_params)
          user.save!
        end

      end

      helpers do
        def allowed_params(params)
          ActionController::Parameters.new(params).permit(
            :email,
            :password,
            :full_name,
            :avatar => [:filename, :tempfile]
          )
        end
      end

    end
  end
end
