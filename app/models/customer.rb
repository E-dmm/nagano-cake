class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :delivery_addresses
  has_many :orders
  has_many :cart_products

  def active_for_authentication?
    super && (self.is_delete == false)
  end
  
  # enum is_delete: { 有効: false, 退会: true }

end
