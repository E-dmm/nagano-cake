class DeliveryAddress < ApplicationRecord

  belongs_to :customer
  
  validates :customer_id, :postcode, :address, :name, presence: true
  validates :postcode, length: {is: 7}, numericality: { only_integer: true }
end
