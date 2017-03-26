module Models
  class Grades < ActiveRecord::Base
    belongs_to :team
  end
end
