module V1
  module Endpoints
    class Points < Grape::API
      before &:authenticate!
      before &:user_is_professor?

      resource :points do
        desc 'Teams points.'

        get do
          present Models::Points.all, with: Entities::Point
        end

      end
    end
  end
end
