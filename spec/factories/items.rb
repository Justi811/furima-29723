FactoryBot.define do
  factory :item do
    id               { 1 }
    user_id          { 1 }
    name             { Faker::Coffee.blend_name }
    description      { Faker::Coffee.notes }
    category_id      { 2}
    condition_id     {2}
    shipping_fee_id  {2}
    shipping_area_id {2}
    shipping_date_id {2}
    price            {1980}
    association :user

    after(:build) do |pic|
      pic.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
