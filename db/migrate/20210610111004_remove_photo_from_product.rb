class RemovePhotoFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :photos
  end
end
