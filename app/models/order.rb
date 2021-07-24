class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_products
  
  validates :postcode, :address, presence: true
  validates :postcode, length: {is: 7}, numericality: { only_integer: true }

  enum payment: { "クレジットカード": 0, "銀行振込": 1 }

  validates :postcode, presence: true
  validates :address, presence: true
  validates :address_name, presence: true

  #注文ステータスで使います
  enum order_status: {
     "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済み":4
  }

  scope :created_order, -> { where(created_at: Time.zone.order) }


  #会員・管理の注文詳細で使ってます
  def sum_of_order_price
    total_price + shipping
  end

end
