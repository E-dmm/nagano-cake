class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :price
      t.integer :quantity
      t.integer :production_status
      t.timestamps
    end
  end
end
