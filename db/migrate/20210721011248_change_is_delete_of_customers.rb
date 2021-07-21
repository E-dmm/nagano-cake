class ChangeIsDeleteOfCustomers < ActiveRecord::Migration[5.2]
  def up
    change_column :customers, :is_delete, :boolean, default: 'false'
  end
  
  def down
    change_column :customers, :is_delete, :boolean
  end
end
