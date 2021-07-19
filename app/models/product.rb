class Product < ApplicationRecord

  belongs_to :genre
  attachment :image

  def add_tax_price
    (self.price * 1.1).round
  end

  enum is_active: { on_sale: 0, draft: 1 }

end
