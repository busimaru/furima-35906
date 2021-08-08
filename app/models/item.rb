class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :user

  has_one_attached :image
  with_options presence:true do
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :name,  length: { maximum: 40 }
    validates :text,  length: { maximum: 1000 }

    with_options numericality: { other_than: 1, message: "can't be blank" }  do
      validates :category_id
      validates :condition_id
      validates :delivery_day_id
      validates :delivery_fee_id
      validates :prefecture_id
    end
  end
end
