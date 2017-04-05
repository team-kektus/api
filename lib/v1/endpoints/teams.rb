module V1
  module Endpoints
    class Teams < Grape::API
      before &:authenticate!

      resource :teams do
        desc 'List all teams.'
        get do
          present Models::Team.all, with: Entities::Team
        end

        route_param :team_id do
          get do
            present Models::Team.find(params[:team_id]), with: Entities::Team
          end

          namespace 'points' do
            get do
              query = Models::Point.all.by_team_id(params[:team_id])
              present query, with: Entities::Point
            end

            before &:ensure_professor!
            params do
              requires :presentation_date, type: Integer, desc: "Number of stage when the team presented this aspect"
              requires :points, type: Float, desc: "Number of points team got for this aspect"
              requires :grading_aspect_id, type: Integer, desc: "ID of the grading aspect these points belong to"
            end
            post do
              present Models::Point.create!(permit_points_params(params)), with: Entities::Point
            end
          end
        end


        # Surrounded this with namespace block because couldn't get it working
        # like above. Somehow putting just "before &:ensure_professor!" blocks
        # querying team points as a normal user. Seems like a bug in grape.
        namespace do
          before &:ensure_professor!
          params do
            requires :name, type: String, desc: "Team name"
            requires :project_name, type: String, desc: "Team's project name"
            optional :repository_url, type: String, desc: "Project's repository url"
            optional :staging_url, type: String, desc: "Project's staging environment url"
          end
          post do
            present Models::Team.create!(permit_teams_params(params)), with: Entities::Team
          end
        end





      end

      helpers do
        def permit_points_params(params)
          ActionController::Parameters.new(params).permit(
            :presentation_date,
            :points,
            :grading_aspect_id,
            :team_id
          )
        end

        def permit_teams_params(params)
          ActionController::Parameters.new(params).permit(
            :name,
            :project_name,
            :repository_url,
            :staging_url
          )
        end
      end

    end
  end
end
