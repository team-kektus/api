module V1
  module Auth
    class PasswordStrategy < ::Warden::Strategies::Base
      def valid?
        return false if request.get?
        user_data = params.fetch("user", {})
        !(user_data[:email].blank? || user_data[:password].blank?)
      end

      def authenticate!
        user = Models::User.find_by_email(params[:user].fetch(:email))

        if user.nil? || user.password != params[:user].fetch(:password)
          fail! :message => 'Authentication failed'
        else
          success! user
        end
      end

    end
  end
end
