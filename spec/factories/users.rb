FactoryBot.define do
  factory :user do
    task { nil }
    name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
  end
end
