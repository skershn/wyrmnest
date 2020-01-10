class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  attr_accessible :username
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
