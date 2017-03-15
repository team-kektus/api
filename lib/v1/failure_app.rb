module V1
  class FailureApp
    def call(env)
      [401, {}, ["Not authorized"]]
    end
  end
end
