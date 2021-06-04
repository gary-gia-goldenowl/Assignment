class CreateCheckouts < ActiveRecord::Migration[6.1]
  def change
    create_table :checkouts do |t|
      t.string :name
      t.string :phonenumber
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
