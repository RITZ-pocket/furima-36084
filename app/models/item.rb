class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :shipping_area

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, :price, :introduction
    with_options numericality: { other_than:1} do
      validates :category_id, :day_to_ship_id, :item_condition_id, :postage_payer_id, :shipping_area_id
    end
  end
  
end
