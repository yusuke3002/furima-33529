FactoryBot.define do
  factory :item do
    item_name          {'テスト画像'}
    description        {'テスト画像です'}
    category_id        {'2'}
    state_id           {'2'}
    delivery_charge_id {'2'}
    prefecture_id      {'2'}
    delivery_days_id   {'2'}
    price              {'1000'}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
