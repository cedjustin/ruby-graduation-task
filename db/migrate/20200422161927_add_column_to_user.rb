class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :activated, :boolean, :default => false
    add_column :users, :available, :boolean, :default => false
  end
end
