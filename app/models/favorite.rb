class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :food
  validates_uniqueness_of :food_id, scope: :customer_id
end
