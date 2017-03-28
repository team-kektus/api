module Models
  class Points < ActiveRecord::Base
    belongs_to :team
    belongs_to :grading_aspect
  end
end
