module V1
  module Auth
    class FailureApp
      def call(env)
        opts = env['warden.options']
        action = opts[:action]
        send(action)
      end

      def permission_denied
        [401, {}, ["Permission denied"]]
      end

      def unauthenticated
        [401, {}, ["Not authorized"]]
      end
    end
  end
end
