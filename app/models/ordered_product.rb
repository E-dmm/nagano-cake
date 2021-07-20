class OrderedProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product

<<<<<<< HEAD
  enum production_status: { "着手不可": 0, "製作待ち": 1, "製作中": 2, "製作完了": 3 }

=======
  #管理者の注文履歴詳細画面で使ってます
  def sum_of_price
    price * quantity
  end
  
  enum production_status: {
     制作不可:0,制作待ち:1,製作中:2,製作終了:3
  }
  
>>>>>>> bd07889f7dfcb1228188362750ff074f54337162
end
