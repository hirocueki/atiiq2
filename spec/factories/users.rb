FactoryBot.define do
  factory :user do
    name { '山田太郎' }
    email { 'yamada@taro.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
