module Models
  class User < ActiveRecord::Base
    include BCrypt
    include Paperclip::Glue

    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing_avatar.png", path: '../static/:attachment/:id/:style/:filename'
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
    do_not_validate_attachment_file_type :avatar

    validates :email, :presence => true


    def password=(new_password)
      @password = new_password
      self.encrypted_password = password_digest(@password) if @password.present?
    end

    # Verifies whether a password (ie from sign in) is the user password.
    def valid_password?(password)
      V1::Auth::Encryptor.compare(encrypted_password, password)
    end

  protected

    def password_digest(password)
      V1::Auth::Encryptor.digest(password)
    end

  end
end
