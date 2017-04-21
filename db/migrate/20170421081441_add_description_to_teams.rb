class AddDescriptionToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :description, :text, :default => "No description."
  end
end
