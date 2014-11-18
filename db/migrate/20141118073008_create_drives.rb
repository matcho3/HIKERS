class CreateDrives < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string :departure
      t.string :destination
      t.datetime :leaving_time
      t.integer :capacity
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
