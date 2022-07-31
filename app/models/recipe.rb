class Recipe < ApplicationRecord
    belongs_to :user #アソシエーション
    has_one_attached :image
    
    with_options presence: true do  
     validates :title
     validates :body
     validates :image
    end
    #ブラウザ立ち上げ時にrollback transactionとターミナルに表記されていたら成功
end
