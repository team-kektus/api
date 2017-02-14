module Models
  class User < ActiveRecord::Base
    belongs_to :team
  end
end
