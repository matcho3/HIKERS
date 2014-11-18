class CreateUserprofiles < ActiveRecord::Migration
  def change
    create_table :userprofiles do |t|
      t.string :name
      t.date :birthday
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
