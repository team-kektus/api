module Example
  module Mockmodels
    class User
      attr_accessor :first_name, :last_name, :email

      def initialize(first_name, last_name, email)
        @first_name = first_name
        @last_name = last_name
        @email = email
      end
    end
  end
end
