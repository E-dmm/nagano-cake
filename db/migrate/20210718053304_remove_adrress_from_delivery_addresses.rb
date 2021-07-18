class RemoveAdrressFromDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivery_addresses, :adrress, :string
  end
end
