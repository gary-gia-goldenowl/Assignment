class AddBestsellerToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :bestseller, :boolean
  end
end
