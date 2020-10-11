class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :consider
  belongs_to_active_hash :days
  belongs_to_active_hash :fee
  belongs_to_active_hash :status

  has_one    :order
  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 1 }, presence:true do
   validates :category_id
   validates :consider_id
   validates :days_id
   validates :fee_id
   validates :status_id
  end

  with_options presence:true do
   validates :name
   validates :details
   validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message:'は半角数字、また300~999999円でお願いします' }
  end

  validate :image_presence

   def image_presence
     if image.attached?
       if !image.content_type.in?(%('image/jpeg image/png'))
         errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
       end
     else
       errors.add(:image, 'ファイルを添付してください')
     end
   end
end
