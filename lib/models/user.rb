module Models
  class User < ActiveRecord::Base
    attr_accessor :login

    # Include default devise modules. Others available are:
    # :encryptable, :timeoutable and :omniauthable
    devise :database_authenticatable, #:registerable,
          #  :recoverable, :rememberable, :trackable, :validatable,
          #  :lockable, 
           :authentication_keys => {email: true, login: false}

    # Setup accessible (or protected) attributes for your model
    # attr_accessible :email, :password, :password_confirmation, :remember_me


    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

    validate :validate_username

    def validate_username
      if User.where(email: email).exists?
        errors.add(:email, :invalid)
      end
    end

  end
end
