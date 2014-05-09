class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :display_name, null: false
      t.string :login_token, limit: 22
      t.string :session_token, limit: 22

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :login_token, unique: true
    add_index :users, :session_token, unique: true
  end
end
