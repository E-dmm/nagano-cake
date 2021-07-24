class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id	
      t.integer :payment	
      t.string :postcode	
      t.string :address	
      t.integer :total_price	
      t.string :address_name	
      t.integer :shipping	
      t.integer :order_status	
      t.timestamps
    end
  end
end
