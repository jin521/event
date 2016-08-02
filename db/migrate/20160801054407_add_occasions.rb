class AddOccasions < ActiveRecord::Migration

  def change
    remove_column :occasions, :date #to remove the previous date table
    change_table(:occasions) do |t|
      t.datetime :date_start
      t.datetime :date_end
    end

  end
end
