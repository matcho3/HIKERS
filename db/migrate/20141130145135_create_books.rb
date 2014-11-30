class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :trip_id
      t.integer :user_id
      t.integer :reservations
      t.integer :status

      t.timestamps
    end
  end
end
