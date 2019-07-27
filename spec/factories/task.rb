FactoryBot.define do
  factory :task do
    title { 'Factoryタイトル1' }
    content { 'Factoryコンテント1' }
      factory :second_task do
        title { 'Factoryタイトル2' }
        content { 'Factoryコンテント2' }
      end
  end
end
