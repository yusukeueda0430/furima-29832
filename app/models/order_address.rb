class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :token, :postal, :consider_id, :municipality, :address, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Postal can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "はハイフンなしで、携帯or固定電話でお願いします"}
  end

  with_options numericality: { other_than: 1 }, presence:true do
    validates :consider_id
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postal: postal, consider_id: consider_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id) 
  end
end

