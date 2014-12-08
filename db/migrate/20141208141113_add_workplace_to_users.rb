class AddWorkplaceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :workplace, :string
  end
end
