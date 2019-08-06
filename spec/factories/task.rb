FactoryBot.define do
  factory :task do
    title { 'Factoryタイトル1' }
    content { 'Factoryコンテント1' }
    expired_at { '8/1' }
      factory :second_task do
        title { 'Factoryタイトル2' }
        content { 'Factoryコンテント2' }
        expired_at { '12/1' }
      end
  end
end
