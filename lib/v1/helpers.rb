module V1
  module Helpers
    def authenticate!(opts={})
      opts[:scope] = :user
      warden.authenticate!(opts)
    end

    def user_signed_in?
      !!current_user
    end

    def current_user
      @current_user ||= warden.authenticate(scope: :user)
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
