class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :drive_id
      t.integer :user_id
      t.integer :reservations
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
