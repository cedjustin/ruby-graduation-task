class AddColumnIsSenderToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :isSender, :boolean, default: false
  end
end
