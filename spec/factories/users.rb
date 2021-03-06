FactoryBot.define do
  factory :user do
    id {10}
    name { "test" }
    email { "test@test.com" }
    password { "test" }
      factory :second_user do
        id {2}
        name { "test2" }
        email { "test2@test.com" }
        password { "test2" }
        factory :admin_user do
          id {5}
          name { "admin" }
          email { "admin@admin.com" }
          password { "admin" }
          admin { true }
        end
      end
  end
end
