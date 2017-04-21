module V1
  module Entities
    class Team < Grape::Entity
      expose :id
      expose :name
      expose :description
      expose :project_name
      expose :repository_url
      expose :staging_url
      expose :avatar
    end
  end
end
