class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :category

      t.string :name
      t.string :description
      t.numeric :price
      t.string :photo

      t.timestamps
    end
  end
end
