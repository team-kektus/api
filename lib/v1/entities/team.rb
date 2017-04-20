module V1
  module Entities
    class Team < Grape::Entity
      expose :id
      expose :name
      expose :project_name
      expose :repository_url
      expose :staging_url
    end
  end
end
