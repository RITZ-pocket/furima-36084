class ShipPurchase
  include ActiveModel::Model
  attr_accessor :shipping_area_id, :user_id, :post_code, :city, :address, :building_name, :phone_number, :purchase_id, :item_id

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
    ship = Ship.create( post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase_id)
    Purchase.create( user_id: user_id, item_id: item_id)
  end
end