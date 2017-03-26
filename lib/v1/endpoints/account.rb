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
          permitted_params = allowed_params(params)
          permitted_params[:avatar] = ActionDispatch::Http::UploadedFile.new(params[:avatar]) if params[:avatar]
          user = Models::User.find_by(email: current_user.email)
          user.update_attributes(permitted_params)
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
