module V1
  module Endpoints
    class Users < Grape::API
      resource :users do

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


        namespace do
          before &:authenticate!

          desc 'List all users.'
          get do
            present Models::User.all, with: Entities::User
          end

          route_param :user_id do
            get do
              present Models::User.find(params[:user_id]), with: Entities::User
            end

            namespace do
              before &:ensure_professor!

              params do
                optional :team_id, type: String
              end
              put do
                user = Models::User.find(params[:user_id])
                user.update_attributes(permit_professor_params(params))
                user.save
                present user, with: Entities::User
              end
            end

            namespace 'permissions' do
              before &:ensure_admin!

              params do
                optional :is_professor, type: Boolean
                optional :is_admin, type: Boolean
              end
              put do
                user = Models::User.find(params[:user_id])
                user.update_attributes(permit_admin_params(params))
                user.save
                present user, with: Entities::User
              end
            end
          end
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

        def permit_professor_params(params)
          ActionController::Parameters.new(params).permit(
            :team_id
          )
        end

        def permit_admin_params(params)
          ActionController::Parameters.new(params).permit(
            :is_professor,
            :is_admin
          )
        end
      end
    end
  end
end
