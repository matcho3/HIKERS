class AddTimeGetLicenseToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :time_get_license, :string
  end
end
