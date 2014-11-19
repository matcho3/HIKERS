class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :departure
      t.string :destination
      t.datetime :leaving_time
      t.integer :capacity
      t.integer :price
      t.integer :driver_id
      t.integer :complete_flag

      t.timestamps
    end
  end
end
