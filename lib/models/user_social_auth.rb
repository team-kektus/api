module Models
  class UserSocialAuth < ActiveRecord::Base
    self.table_name = "users_social_auth"

    belongs_to :user


    def get_api
      self.get_api(self.backend, self.access_token)
    end


    def self.get_api(backend, access_token)
      case backend
      when 'facebook'
        return Koala::Facebook::API.new(access_token)
      end
    end

  end
end
