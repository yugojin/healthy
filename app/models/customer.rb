class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i(google_oauth2)

  attachment :image
  has_many :foods, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_foods, through: :favorites, source: :food
  has_many :comments, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
      customer.email = auth.info.email
      customer.name = auth.info.name
      customer.password = Devise.friendly_token[0, 20]
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@gmail.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
  end

  def Customer.search(search, customer_or_food)
    if customer_or_food == "customers"
      Customer.where(['name LIKE ?', "%#{search}%"])
    else
      Customer.all
    end
  end
end
