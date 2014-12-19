class AddSelfIntroductionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :self_introduction, :string
  end
end
