class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :isPatient, :boolean, default: false
  end
end
