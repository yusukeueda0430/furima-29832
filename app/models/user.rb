class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :products
         has_many :orders

         name = /\A[ぁ-んァ-ン一-龥]/
         hurigana = /\A[ァ-ヶー－]+\z/
         password = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i

         with_options presence:true do
         validates :password, format: { with: password , message: "英数字混合でお願いします" }
         validates :nickname
         validates :first_name, format: { with: name , message: "漢字、ひらがな、カタカナでお願いします" }
         validates :first_hurigana, format: { with: hurigana , message: "カタカナでお願いします"}
         validates :last_name, format: { with: name , message: "漢字、ひらがな、カタカナでお願いします" }
         validates :last_hurigana, format: { with: hurigana , message: "カタカナでお願いします" }
         validates :birthday
         end
end
