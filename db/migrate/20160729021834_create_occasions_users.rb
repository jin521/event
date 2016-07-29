class CreateOccasionsUsers < ActiveRecord::Migration
  def change
    create_table :occasions_users do |t|
      t.integer :occasion_id
      t.integer :user_id
    end
  end
end
