class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day_to_ship
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :shipping_area

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :name, :introduction, :image
    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price,
                numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    end
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id, :day_to_ship_id, :item_condition_id, :postage_payer_id, :shipping_area_id
    end
  end
end
