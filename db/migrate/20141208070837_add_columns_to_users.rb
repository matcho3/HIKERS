class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    add_column :users, :birthday, :date
    add_column :users, :image, :string
  end
end
