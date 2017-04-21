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
          permitted_params = allowed_user_params(params)
          permitted_params[:avatar] = convert_avatar(params[:avatar]) if params[:avatar]
          current_user.update_attributes(permitted_params)
          current_user.save!
        end


        namespace :team do
          get do
            present current_user.team, with: Entities::Team
          end

          desc 'Change team data.'
          put do
            permitted_params = allowed_team_params(params)
            permitted_params[:avatar] = convert_avatar(params[:avatar]) if params[:avatar]
            current_user.team.update_attributes(permitted_params)
            current_user.team.save!
          end
        end

      end

      helpers do
        def allowed_user_params(params)
          ActionController::Parameters.new(params).permit(
            :password,
            :full_name,
            :address,
            :speciality,
            :county,
            :avatar => [:filename, :tempfile]
          )
        end

        def allowed_team_params(params)
          ActionController::Parameters.new(params).permit(
            :repository_url,
            :staging_url,
            :description,
            :avatar => [:filename, :tempfile]
          )
        end

        def convert_avatar(avatar)
          ActionDispatch::Http::UploadedFile.new(avatar)
        end
      end

    end
  end
end
