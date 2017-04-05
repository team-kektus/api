class AddTablePoints < ActiveRecord::Migration[5.0]
  def change
    create_table(:points) do |t|

      t.integer :presentation_date, null: false
      t.float :points, :default => 0, null: false

      t.timestamps

    end

      add_reference :points, :team, :index => true, foreign_key: true, null: false
      add_reference :points, :grading_aspect, :index => true, foreign_key: true, null: false
  end
end
