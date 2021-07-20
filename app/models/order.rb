class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_products

  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }


  #注文ステータスで使います
  enum order_status: {
     入金待ち:0,入金確認:1,製作中:2,発送準備中:3,発送済み:4
  }

  scope :created_order, -> { where(created_at: Time.zone.order) } # なんて書くのこれ

  #会員の注文履歴詳細で使ってます
  def sum_of_order_price
    total_price * shipping
  end

end
