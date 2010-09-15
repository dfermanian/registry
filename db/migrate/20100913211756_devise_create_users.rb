class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable
#      t.timestamps
    end

    add_index :users, :email                #,:unique => true

    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end

  def self.down

    remove_index :users, :email
    remove_index :users, :confirmation_token
    remove_index :users, :reset_password_token
  end
end
