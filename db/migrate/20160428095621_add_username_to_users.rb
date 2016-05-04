class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, unique: true, limit: 30
    # username should not more than 5 char
  end
end
