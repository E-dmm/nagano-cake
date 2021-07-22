class CartProduct < ApplicationRecord

  belongs_to :product
  belongs_to :customer

  def add_tax_price
    (self.price * 1.1).round
  end

end
