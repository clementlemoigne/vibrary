class AddProfileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :username, :string
    add_column :users, :whitelist, :string, array: true, default: []
    add_column :users, :blacklist, :string, array: true, default: []
  end
end
