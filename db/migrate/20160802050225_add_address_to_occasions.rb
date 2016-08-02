class AddAddressToOccasions < ActiveRecord::Migration
  def change
    add_column :occasions, :address, :string
  end
end
