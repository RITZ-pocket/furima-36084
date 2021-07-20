FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000aaa' }
    password_confirmation { password }
    family_name           { '苗字' }
    family_name_kana      { 'ミョウジ' }
    first_name            { '名前' }
    first_name_kana       { 'ナマエ' }
    birth_date            { '2021-07-17' }
  end
end
