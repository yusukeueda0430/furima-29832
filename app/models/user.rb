class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :products
         has_many :orders
         validates :password, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}, presence: true
         validates :nickname, presence: true
         validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}, presence: true
         validates :first_hurigana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}, presence: true
         validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}, presence: true
         validates :last_hurigana, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}, presence: true
         validates :birthday, presence: true
end
