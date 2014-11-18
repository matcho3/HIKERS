class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :user_id
      t.string :car_image

      t.timestamps
    end
  end
end
