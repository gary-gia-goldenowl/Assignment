# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :category

      t.string :name
      t.string :description
      t.numeric :price
      t.string :photos

      t.timestamps
    end
  end
end
