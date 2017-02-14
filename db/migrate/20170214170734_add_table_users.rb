class AddTableUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.references :team, references: :teams
    end
  end
end
