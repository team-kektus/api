class AddTableUsersSocialAuth < ActiveRecord::Migration[5.0]
  def change
    create_table(:users_social_auth) do |t|
      t.references :user, :index => true, foreign_key: { to_table: :users }, null: false
      t.string :provider, null: false
      t.string :uid, null: false
      t.json :extra_data, null: false
    end

    add_index :users_social_auth, [:user_id, :provider], :unique => true
  end
end
