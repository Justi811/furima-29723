FactoryBot.define do
  factory :order_address do
    postcode        {'559-0034'}
    prefecture_id   {28}
    city            {'大阪市'}
    address          {'住之江区南港北1丁目5-102'}
    building        {'インテックス大阪'}
    phone           {'05055181147'}
    token             { 'qawsedrftgyhujikolp' }
    user_id           { 1 }
    item_id           { 1 }
  end
end
