module Models
  class Team < ActiveRecord::Base
    has_many :users
    has_many :points
  end
end
