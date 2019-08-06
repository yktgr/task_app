require 'rails_helper'

RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(title: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(title: '失敗テスト', content: '')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(title: 'OK', content: 'OK')
    expect(task).to be_valid
  end

  describe "scopeテスト" do
    before do
      @task1 = FactoryBot.create(:task)
      @task2 = FactoryBot.create(:second_task)
      @task3 = FactoryBot.create(:third_task)
    end

  it "search_title" do
   tasks = Task.search_title("Factoryタイトル1")
   expect(tasks).to include @task1
  end

  it "search_status" do
    tasks = Task.search_status("未着手")
    expect(tasks).to include @task1 and include @task2
  end

  it "search_all" do
    tasks = Task.search_all("Factoryタイトル3","着手")
    expect(tasks).to include @task3
  end

  end
  end
