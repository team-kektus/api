module V1
  module Endpoints
    class GradingAspects < Grape::API
      before &:authenticate!

      resource :grading_aspects do

        desc 'Return grading aspects.'
        get do
          present Models::GradingAspect.all, with: Entities::GradingAspect
        end


        namespace do
          before &:ensure_professor!

          desc 'Add new grading aspect.'
          params do
            requires :number, type: Integer, desc: "Aspect identifier"
            requires :name, type: String, desc: "Name"
            optional :deadline, type: String, desc: "Aspect submission deadline"
            requires :max_points, type: Integer, desc: "Maximum number of points this aspect can give. Defaults to 0"
            optional :url, type: String, desc: "URL of webpage that holds descprition of his grading aspect. Defaults to ''"
            optional :is_multiple, type: Boolean, desc: "Defines if this aspect can be graded multiple times. Defaults to false"
          end
          post do
            present Models::GradingAspect.create!(allowed_params(params)), with: Entities::GradingAspect
          end
        end

      end


      helpers do
        def allowed_params(params)
          ActionController::Parameters.new(params).permit(
            :number,
            :name,
            :deadline,
            :max_points,
            :url,
            :is_multiple
          )
        end
      end

    end
  end
end
