class AddExtraDataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :speciality, :string, :default => ""
    add_column :users, :address, :string, :default => ""
    add_column :users, :county, :string, :default => ""
  end
end
