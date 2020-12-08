class Food < ApplicationRecord
  belongs_to :customer
  attachment :image

end
