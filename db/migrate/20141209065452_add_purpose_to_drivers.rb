class AddPurposeToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :purpose, :string
  end
end
