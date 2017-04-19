class AddTableUsers < ActiveRecord::Migration[5.0]
  def change
    create_table(:users) do |t|

      t.string :full_name, :null => false
      t.string :email,              :null => false
      t.string :encrypted_password, :null => true

      t.timestamps
    end

    add_index :users, :email,                :unique => true
  end
end
