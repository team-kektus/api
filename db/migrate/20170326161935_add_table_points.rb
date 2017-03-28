class AddTablePoints < ActiveRecord::Migration[5.0]
  def change
    create_table(:points) do |t|

      t.string :deadline,
      t.string :presentation_date,
      t.string :points

      t.timestamps

    end

      add_reference :points, :teams, :index => true, foreign_key: true
      add_reference :points, :grading_aspects, :index => true, foreign_key: true
  end
end
