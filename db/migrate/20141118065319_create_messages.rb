class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :to_user_id
      t.integer :from_user_id
      t.text :content

      t.timestamps
    end
    add_index :messages, :to_user_id
    add_index :messages, :from_user_id
    add_index :messages, [:to_user_id, :from_user_id], unique: true
  end
end
