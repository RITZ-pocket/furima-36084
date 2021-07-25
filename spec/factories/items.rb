FactoryBot.define do
  factory :item do
    name              { 'item' }
    price             { '300' }
    introduction      { 'text' }
    category_id       { 3 }
    item_condition_id { 3 }
    postage_payer_id  { 3 }
    shipping_area_id  { 3 }
    day_to_ship_id    { 3 }
    association :user
  end
end
