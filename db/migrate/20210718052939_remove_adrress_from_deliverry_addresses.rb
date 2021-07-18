class RemoveAdrressFromDeliverryAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliverry_addresses, :adress, :string
  end
end
