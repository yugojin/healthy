class AddCustomerIdToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :customer_id, :integer
  end
end
