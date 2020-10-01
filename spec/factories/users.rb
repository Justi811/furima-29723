FactoryBot.define do
  factory :user do
    nickname             {"furima"}
    email                {"fff@gmail.com"}
    password             {"Test111"}
    password_confirmation {password}
  end
end