class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.text :body
      t.integer :read_flag, default: 0
      t.integer :review_id
      t.integer :book_id

      t.timestamps
    end
  end
end
