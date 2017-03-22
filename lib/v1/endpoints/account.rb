module V1
  module Endpoints
    class Account < Grape::API
      before &:authenticate!

      resource :account do
        get do
          present current_user, with: Entities::User
        end

        desc 'Change user data.'
        put do
          user = Models::User.find_by(email: current_user.email)
          user.update_attributes(allowed_params(params))
          user.save!
        end

      end

      helpers do
        def allowed_params(params)
          ActionController::Parameters.new(params).permit(
            :password,
            :full_name,
            :address,
            :speciality,
            :county,
            :avatar => [:filename, :tempfile]
          )
        end
      end

    end
  end
end
