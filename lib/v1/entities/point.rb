module V1
  module Entities
    class Point < Grape::Entity
      expose :presentation_date
      expose :points
      expose :grading_aspect, using: Entities::GradingAspect
    end
  end
end
