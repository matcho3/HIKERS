class AddLicenseHistoryToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :license_history, :string
  end
end
