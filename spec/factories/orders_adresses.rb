FactoryBot.define do
  factory :order_adress do
    postcode { '123-4567' }
    prefecture_id { 2 }
    municipalities { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09079676691' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
