module V1
  module Endpoints
    class GradingAspects < Grape::API
      resource :grading_aspects do
        desc 'Return grading aspects.'

        get do
          present Models::GradingAspects.all, with: Entities::GradingAspect
        end

      end
    end
  end
end
