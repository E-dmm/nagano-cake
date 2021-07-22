class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery_addresses
  has_many :orders
  has_many :cart_products
  
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, presence: true
  validates :postcode, length: {is: 7}, numericality: { only_integer: true }
  validates :phone_number, numericality: { only_integer: true } 
  
  def active_for_authentication?
    super && (self.is_delete == false)
  end

end
