module V1
  module Auth
    module Encryptor
      # This code belongs to Devise gem.

      def self.digest(password)
        if Config.pepper.present?
          password = "#{password}#{Config.pepper}"
        end
        ::BCrypt::Password.create(password, cost: Config.stretches).to_s
      end

      def self.compare(hashed_password, password)
        return false if hashed_password.blank?
        bcrypt   = ::BCrypt::Password.new(hashed_password)
        if Config.pepper.present?
          password = "#{password}#{Config.pepper}"
        end
        password = ::BCrypt::Engine.hash_secret(password, bcrypt.salt)
        self.secure_compare(password, hashed_password)
      end

      # constant-time comparison algorithm to prevent timing attacks
      def self.secure_compare(a, b)
        return false if a.blank? || b.blank? || a.bytesize != b.bytesize
        l = a.unpack "C#{a.bytesize}"

        res = 0
        b.each_byte { |byte| res |= byte ^ l.shift }
        res == 0
      end
    end
  end
end
