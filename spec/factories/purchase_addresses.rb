FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '大阪市北区' }
    block { '梅田' }
    phone_number { '09012345678' }
  
  end
end
