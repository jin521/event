class AddUserIdToOccasions < ActiveRecord::Migration
  def change
    add_column :occasions, :user_id, :integer
  end
end
