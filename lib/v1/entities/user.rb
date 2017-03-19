module V1
  module Entities
    class User < Grape::Entity
      expose :full_name
      expose :email
      # expose :team_id
      expose :is_admin
      expose :is_professor
      expose :avatar
    end
  end
end
