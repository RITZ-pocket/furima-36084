class ItemShip
  include ActiveModel::Model
  attr_accessor :name, :price, :introduction, :categpry_id, :postage_payer_id, :shipping_area_id, :day_to_ship_id, :user_id, :post_code, :city, :address, :building_name, :phone_number, :purchase_id

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

  with_options presence: true do
    validates :city, :address
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :post_code
    end
    with_options format: { with: /\A\d{10,11}\z/ } do
      validates :phone_number
    end
  end

  def save
    item = Item.create( name: name, price: price, introduction: introduction, category_id: category_id, item_condition_id: item_condition_id, postage_payer_id: postage_payer_id, shipping_area_id: shipping_area_id, day_to_ship_id: day_to_ship_id, user_id: user.id)
    Ship.create( post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end