module Models
  class GradingAspects < ActiveRecord::Base
    has_many :points
  end
end
