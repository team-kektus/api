require 'paperclip'

class AddAvatarToTeams < ActiveRecord::Migration[5.0]
  include ::Paperclip::Schema

  def change
    add_attachment :teams, :avatar
  end
end
