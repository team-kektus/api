module Models
  class Team < ActiveRecord::Base
    has_many :users
  end
end
