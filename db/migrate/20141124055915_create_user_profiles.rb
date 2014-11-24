class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.date :birthday
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
