class AddTableTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
    end
  end
end
