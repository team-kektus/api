module V1
  module Endpoints
    class Teams < Grape::API
      resource :teams do
        desc 'List all teams.'
        get do
          present Models::Team.all, with: Entities::Team
        end
      end

    end
  end
end
