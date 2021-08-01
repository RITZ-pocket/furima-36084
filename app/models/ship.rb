class Ship < ApplicationRecord

  belongs_to :purchase
  
  with_options presence: true do
    validates :city, :address
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :post_code
    end
    with_options format: { with: /\A\d{10,11}\z/ } do
      validates :phone_number
    end
    with_options numericality: {other_than: 1, message: "can't be blank"} do
      validates :shipping_area_id
    end
  end
end
