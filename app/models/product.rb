class Product < ApplicationRecord

  attachment :image

  belongs_to :genre
  
  validates :genre_id, :name, :price, presence: true
  validates :price, numericality: { only_integer: true }

  def add_tax_price
    (self.price * 1.1).round
  end

  enum is_active: { 販売中: true, 販売停止中: false }

end
