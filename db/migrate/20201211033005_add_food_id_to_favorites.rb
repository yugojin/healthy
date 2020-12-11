class AddFoodIdToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :food_id, :integer
    add_column :favorites, :customer_id, :integer
  end
end
