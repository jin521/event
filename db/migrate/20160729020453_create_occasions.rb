class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.string :title
      t.date :date
      t.string :image
      t.string :location
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :website
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
