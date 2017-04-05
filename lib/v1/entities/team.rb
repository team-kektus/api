module V1
  module Entities
    class Team < Grape::Entity
      expose :id
      expose :name
    end
  end
end
