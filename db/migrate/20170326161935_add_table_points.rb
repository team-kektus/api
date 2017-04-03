class AddTablePoints < ActiveRecord::Migration[5.0]
  def change
    create_table(:points) do |t|

      t.string :deadline, :default => ""
      t.string :presentation_date, :default => ""
      t.string :points, :default => ""

      t.string :stage1_points, :default => ""
      t.string :stage2_points, :default => ""
      t.string :stage3_points, :default => ""
      t.string :stage4_points, :default => ""
      t.string :stage5_points, :default => ""
      t.string :stage6_points, :default => ""
      t.string :stage7_points, :default => ""
      t.string :stage8_points, :default => ""

      t.timestamps

    end

      add_reference :points, :teams, :index => true, foreign_key: true
      add_reference :points, :grading_aspects, :index => true, foreign_key: true
  end
end
