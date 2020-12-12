class AddCustomerIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :customer_id, :integer
    add_column :comments, :food_id, :integr
  end
end
