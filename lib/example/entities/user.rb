module Example
  module Entities
    class User < Grape::Entity
      expose :name
      expose :email
      expose :mail_domain

      private

      def mail_domain
        email = object.email
        email[email.index('@') + 1..-1]
      end

      def name
        "#{object.first_name} #{object.last_name}"
      end

    end
  end
end
