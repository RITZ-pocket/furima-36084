FactoryBot.define do
  factory :ship_purchase do
    post_code        { '111-1111' }
    shipping_area_id { 3 }
    city             { '都市名' }
    address          { '住所' }
    building_name    { '建物名' }
    phone_number     { '11111111111'}
  end
end
