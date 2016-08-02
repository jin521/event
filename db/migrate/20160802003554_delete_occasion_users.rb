class DeleteOccasionUsers < ActiveRecord::Migration
  def change
    drop_table :occasions_users
  end
end
