module V1
  module Entities
    class User < Grape::Entity
      expose :full_name
      expose :email
      # expose :team_id
    end
  end
end
