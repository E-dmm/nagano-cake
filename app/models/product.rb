class Product < ApplicationRecord

  belongs_to :genre
  attachment :image

end
