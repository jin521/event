class AddPriceToOccasions < ActiveRecord::Migration
  def change
  add_column :occasions, :price, :integer
  end
end
