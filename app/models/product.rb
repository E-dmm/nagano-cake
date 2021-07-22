class Product < ApplicationRecord

  attachment :image

  belongs_to :genre

  def add_tax_price
    (self.price * 1.1).floor
    # selfにproductの情報が入る
  end

  enum is_active: { 販売中: true, 販売停止中: false }

end
