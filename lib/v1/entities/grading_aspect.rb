module V1
  module Entities
    class GradingAspect < Grape::Entity
      expose :number
      expose :name
      expose :deadline
      expose :max_points
      expose :is_multiple
      expose :url
    end
  end
end
