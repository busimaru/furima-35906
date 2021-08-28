class OrderAdress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :postcode, :prefecture_id, :municipalities, :address, :building_name, :phone_number

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+\z/, allow_blank: true, message: 'is number only' }, length: { in: 10..11 }
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Adress.create(postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities, address: address,
                  phone_number: phone_number, order_id: order.id)
  end
end
