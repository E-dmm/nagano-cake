class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
       t.integer :customer_id
       t.string :adrress
       t.string :postcode
       t.string :name
       t.timestamps
    end
  end
end
