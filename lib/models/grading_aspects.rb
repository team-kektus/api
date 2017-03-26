module Models
  class GradingAspects < ActiveRecord::Base
    belongs_to :Grade
  end
end
