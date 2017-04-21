module Models
  class Team < ActiveRecord::Base
    include Paperclip::Glue

    has_many :users
    has_many :points


    validates :description, length: {minimum: 10, maximum: 50}, allow_blank: true


    has_attached_file :avatar,
                      styles: { medium: "300x300>", thumb: "100x100>"},
                      url: '/static/:attachment/teams/:id/:style/:filename',
                      default_url: "/static/images/:style/missing_team_avatar.png",
                      path: "#{Config.staticfiles_path}/:attachment/teams/:id/:style/:filename"

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/]
    do_not_validate_attachment_file_type :avatar

  end
end
