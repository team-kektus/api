class AddTableGradingAspects < ActiveRecord::Migration[5.0]
  def change
    create_table(:grading_aspects) do |t|

      t.string :number, :null => false
      t.string :name, :null => false
      t.string :deadline,
      t.string :max_points,
      t.boolean :is_aspect, :null => false
      t.string :url
  
    end
  end
end
