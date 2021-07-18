class AddAddressToDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :delivery_addresses, :address, :string
  end
end
