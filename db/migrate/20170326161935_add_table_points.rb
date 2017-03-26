class AddTablePoints < ActiveRecord::Migration[5.0]
  def change
    create_table(:grades) do |t|

      t.string :deadline,
      t.string :presentation_date,
      t.string :points

      t.timestamps

    end

      add_reference :grades, :teams, :index => true, foreign_key: true
  end
end
