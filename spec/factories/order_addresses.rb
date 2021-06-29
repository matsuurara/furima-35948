FactoryBot.define do
  factory :order_address do
    postal_code      {'123-4567'}
    region_id        {2}
    city             {'テスト'}
    house_number     {'テスト'}
    floor            {'テスト'}
    telephone_number {'12345678901'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
