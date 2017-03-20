module V1
  module Entities
    class User < Grape::Entity
      expose :full_name
      expose :email
      # expose :team_id
      expose :is_admin
      expose :is_professor
      expose :avatar
      expose :speciality
      expose :address
      expose :county
    end
  end
end
