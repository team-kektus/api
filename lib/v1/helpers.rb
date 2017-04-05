module V1
  module Helpers
    def authenticate!(opts={})
      opts[:scope] = :user
      warden.authenticate!(opts)
    end

    def ensure_admin!
      throw(:warden, :action => "permission_denied") unless user_is_admin?
    end

    def ensure_professor!
      throw(:warden, :action => "permission_denied") unless user_is_professor?
    end

    def user_signed_in?
      !!current_user
    end

    def user_is_admin?
      current_user.is_admin
    end

    def user_is_professor?
      current_user.is_professor
    end

    def current_user
      @current_user ||= warden.authenticate!(scope: :user)
    end

    def user_session
      current_user && warden.session(:user)
    end

    def warden
      request.env['warden']
    end

    def session
      request.env['rack.session']
    end
  end
end
