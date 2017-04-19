module Models
  class User < ActiveRecord::Base
    include BCrypt
    include Paperclip::Glue

    belongs_to :team
    has_many :social_auths, class_name: "UserSocialAuth"

    validates :email, :presence => true


    has_attached_file :avatar,
                      styles: { medium: "300x300>", thumb: "100x100>"},
                      url: '/static/:attachment/:id/:style/:filename',
                      default_url: "/static/images/:style/missing_avatar.png",
                      path: "#{Config.staticfiles_path}/:attachment/:id/:style/:filename"

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
    do_not_validate_attachment_file_type :avatar


    def password=(new_password)
      @password = new_password
      self.encrypted_password = password_digest(@password) if @password.present?
    end

    # Verifies whether a password (ie from sign in) is the user password.
    def valid_password?(password)
      V1::Auth::Encryptor.compare(encrypted_password, password)
    end

    def self.find_by_social_backend(provider, access_token)
      api = UserSocialAuth.get_api(provider, access_token)
      data = ActionController::Parameters.new(api.get_object('me', fields: [:email, :name])).merge(access_token: access_token, provider: provider).permit(
        :email, :name, :id, :access_token, :provider
      )
      auth = UserSocialAuth.find_by(provider: data[:provider], uid: data[:id])

      if auth.present?
        auth.user
      else
        user = User.new(full_name: data[:name], email: data[:email])
        auth = UserSocialAuth.new(provider: data[:provider], uid: data[:id], extra_data: data.permit(:id, :access_token))
        user.social_auths.append(auth)
        auth.save!
        user.save!
        user
      end
    end


  protected

    def password_digest(password)
      V1::Auth::Encryptor.digest(password)
    end

  end
end
