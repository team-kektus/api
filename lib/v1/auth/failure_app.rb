module V1
  module Auth
    class FailureApp
      def call(env)
        [401, {}, ["Not authorized"]]
      end
    end
  end
end
