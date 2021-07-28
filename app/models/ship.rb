class Ship < ApplicationRecord
  with_options presence: true do
    validates :city, :address
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :post_code
    end
    with_options format: { with: /\A\d{10,11}\z/ } do
      validates :phone_number
    end
  end
end
