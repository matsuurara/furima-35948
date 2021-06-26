FactoryBot.define do
  factory :item do
    association :user

    name                { 'test' }
    info                { 'test' }
    price               { 1000 }
    status_id           { 2 }
    delivery_charger_id { 2 }
    delivery_date_id    { 2 }
    category_id         { 2 }
    region_id           { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
