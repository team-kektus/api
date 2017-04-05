module Models
  class GradingAspect < ActiveRecord::Base
    has_many :points
  end
end
