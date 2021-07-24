class CartProduct < ApplicationRecord

  belongs_to :product
  belongs_to :customer
  
  validates :customer_id, :product_id, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }

  validates :quantity, presence: true

  def add_tax_price
    (self.price * 1.1).round
  end

end
