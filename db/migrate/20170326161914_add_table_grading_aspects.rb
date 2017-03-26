class AddTableGradingAspects < ActiveRecord::Migration[5.0]
  def change
    create_table(:grading_aspects) do |t|

      t.string :ref, :null => false
      t.string :name, :null => false
      t.string :deadline,
      t.string :max_points,
      t.string :url

    end

      add_reference :grades, :index => true, foreign_key: true

  end
end
