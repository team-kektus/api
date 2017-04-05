module Models
  class Point < ActiveRecord::Base
    belongs_to :team
    belongs_to :grading_aspect

    scope :by_team_id, -> (team_id) { where team_id: team_id }
  end
end
