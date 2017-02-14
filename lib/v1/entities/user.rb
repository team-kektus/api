module V1
  module Entities
    class User < Grape::Entity
      expose :username
      expose :team_id
    end
  end
end
