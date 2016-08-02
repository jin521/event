class AddEventfindaIdToOccasions < ActiveRecord::Migration
  def change
    add_column :occasions, :eventfinda_id, :integer
  end
end
