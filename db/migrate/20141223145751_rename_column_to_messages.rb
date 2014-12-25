class RenameColumnToMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :from_user_id, :sending_id
    rename_column :messages, :to_user_id, :receiving_id
  end
end
