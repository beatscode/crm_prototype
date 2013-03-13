class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :product_type

      t.timestamps
    end
  end
  def down
  	drop_table :products
  end
end
