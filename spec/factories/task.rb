FactoryBot.define do
  factory :task do
    user_id {10}
    title { 'Factoryタイトル1' }
    content { 'Factoryコンテント1' }
    expired_at { '1/1' }
    status {'未着手'}
    priority{'low'}
      factory :second_task do
        user_id {10}
        title { 'Factoryタイトル2' }
        content { 'Factoryコンテント2' }
        status {'未着手'}
        priority{'middle'}
        expired_at { '2/1' }
          factory :third_task do
            user_id {10}
            title { 'Factoryタイトル3' }
            content { 'Factoryコンテント3' }
            status {'着手'}
            expired_at { '3/1' }
            priority{'high'}
        end
      end
  end
end
