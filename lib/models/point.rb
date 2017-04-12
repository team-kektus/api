module Models
  class Point < ActiveRecord::Base
    belongs_to :team
    belongs_to :grading_aspect

    scope :by_team_id, -> (team_id) { where team_id: team_id }
    scope :multiple, -> (is_multiple) { joins(:grading_aspects).where('grading_aspect.is_multiple': is_multiple)}
  end
end
