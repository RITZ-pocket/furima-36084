class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :shipping_area
  
  belongs_to :user
  has_one_attached :image
  
end
