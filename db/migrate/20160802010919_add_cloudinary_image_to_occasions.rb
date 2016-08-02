class AddCloudinaryImageToOccasions < ActiveRecord::Migration
  def change
    add_column :occasions, :cloudinary_image, :string
  end
end
