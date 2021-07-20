class OrderedProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product

  def sum_of_price
    price * quantity
  end

  enum production_status: {
     制作不可:0,制作待ち:1,製作中:2,製作終了:3
  }

end
