class AddTableGradingAspects < ActiveRecord::Migration[5.0]
  def change
    create_table(:grading_aspects) do |t|

      t.string :number, :null => true
      t.string :name, :null => false
      t.integer :deadline, :null => true
      t.integer :max_points, :null => false, :default => 0
      t.string :url, :default => ""
      t.boolean :is_multiple, :null => false, :default => false

    end

    add_index :grading_aspects, :number, :unique => true
  end
end
