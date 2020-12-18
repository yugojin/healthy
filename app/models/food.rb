class Food < ApplicationRecord
  belongs_to :customer
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :favorited_customers, through: :favorites, source: :customer
  has_many :comments, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  def save_tags(savefood_tags)
    savefood_tags.each do |new_name|
    food_tag = Tag.find_or_create_by(name: new_name)
    self.tags << food_tag
    end
  end

  def Food.search(search, customer_or_food)
    if customer_or_food == "foods"
       Food.where(['food_name LIKE ?', "%#{search}%"])
    else
      Food.all
    end
  end

end
