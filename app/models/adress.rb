class Adress < ApplicationRecord
  belongs_to :order

  #  with_option presence: true do
  #    validates :postcode
  #    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  #    validates :municipalities
  #    validates :address
  #    validates :phone_number
  #  end
end
