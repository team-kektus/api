module V1
  module Entities
    class User < Grape::Entity
      expose :email
      # expose :team_id
    end
  end
end
