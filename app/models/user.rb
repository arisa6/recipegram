class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image  #idは書かない
  has_many :recipes, dependent: :destroy #userが削除されたら関連づいているレシピも削除される
end
