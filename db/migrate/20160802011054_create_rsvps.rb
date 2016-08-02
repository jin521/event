class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :occasion_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
