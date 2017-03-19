require 'paperclip'

class ChangeTableUsers < ActiveRecord::Migration[5.0]
  include ::Paperclip::Schema

  def change
    add_column :users, :is_admin, :boolean, :default => false, :null => false
    add_column :users, :is_professor, :boolean, :default => false, :null => false
    add_attachment :users, :avatar
  end
end
