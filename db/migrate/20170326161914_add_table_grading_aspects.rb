class AddTableGradingAspects < ActiveRecord::Migration[5.0]
  def change
    create_table(:grading_aspects) do |t|

      t.string :number, :default => ""
      t.string :name, :default => ""
      t.string :deadline, :default => ""
      t.string :max_points, :default => ""
      t.string :url, :default => ""
      t.boolean :is_aspect, :null => false

    end
  end
end
