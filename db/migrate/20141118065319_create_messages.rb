class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :receiving_id
      t.integer :sending_id
      t.text :content

      t.timestamps
    end
    add_index :messages, :receiving_id
    add_index :messages, :sending_id
    add_index :messages, [:receiving_id, :sending_id], unique: true
  end
end
