class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_days
  belongs_to :delivery_fee
  belongs_to :prefecture

  belongs_to :user

  has_one_attached :image

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :delivery_days_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_fee_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
end
