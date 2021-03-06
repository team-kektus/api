module V1
  module Entities
    class User < Grape::Entity
      expose :id
      expose :full_name
      expose :email
      expose :is_admin
      expose :is_professor
      expose :avatar
      expose :speciality
      expose :address
      expose :county
      expose :team, using: Entities::Team
    end
  end
end
