module V1
  module Entities
    class Point < Grape::Entity
      expose :deadline
      expose :presentation_date
      expose :points
      expose :stage1_points
      expose :stage2_points
      expose :stage3_points
      expose :stage4_points
      expose :stage5_points
      expose :stage6_points
      expose :stage7_points
      expose :stage8_points
    end
  end
end
