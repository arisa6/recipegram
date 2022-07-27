class Recipe < ApplicationRecord
    belongs_to :user #アソシエーション
    has_one_attached :image
end
