class AddTablePoints < ActiveRecord::Migration[5.0]
  def change
    create_table(:points) do |t|

      t.string :deadline,
      t.string :presentation_date,
      t.string :points

      t.string :stage1_points
      t.string :stage2_points
      t.string :stage3_points
      t.string :stage4_points
      t.string :stage5_points
      t.string :stage6_points
      t.string :stage7_points
      t.string :stage8_points


      t.timestamps

    end

      add_reference :points, :teams, :index => true, foreign_key: true
      add_reference :points, :grading_aspects, :index => true, foreign_key: true
  end
end
