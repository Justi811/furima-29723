FactoryBot.define do
  factory :user do
    nickname             { Faker::Name.initials(number: 5) }
    email                { ForgeryJa('email').address }
    name                 { '圭人' }
    surname              { '古間' }
    kana_name            { 'ケイト' }
    kana_surname         { 'フルマ' }
    password             { 'Test111' }
    password_confirmation { password }
    birthday { '1989-12-25'}
  end
end
