class AddDataToTeams < ActiveRecord::Migration[5.0]
  def change
    # add_column :teams, :name, :string, null: false
    add_column :teams, :project_name, :string, null: false
    add_column :teams, :repository_url, :string, :default => ""
    add_column :teams, :staging_url, :string, :default => ""

    add_reference :users, :team, :index => true, foreign_key: true
  end
end
