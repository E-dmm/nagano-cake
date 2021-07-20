class Product < ApplicationRecord

  belongs_to :genre
  attachment :image

  def add_tax_price
    (self.price * 1.1).round
  end

  enum is_active: { 販売中: true, 販売停止中: false }

end
