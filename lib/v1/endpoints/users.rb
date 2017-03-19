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
          requires :full_name, type: String, desc: "Full name"
          requires :email, type: String, desc: "Email"
          requires :password, type: String, desc: "Password"
          optional :avatar, type: Rack::Multipart::UploadedFile, desc: "Profile picture"
        end
        post do
          permitted_params = allowed_params(params)
          permitted_params[:avatar] = ActionDispatch::Http::UploadedFile.new(params[:avatar]) if params[:avatar]
          user = Models::User.create!(permitted_params)
          present user, with: Entities::User
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
