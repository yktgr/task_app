require 'rails_helper'

RSpec.describe Task, type: :model do
  before  do
    FactoryBot.create(:user)
  end

  it "空があるとバリデーションが通らない" do
    task = Task.new(
                title: 'Factoryタイトル3' ,
                content:'',
                status:'着手',
                expired_at: '3/1',
                priority:'high')
    expect(task).not_to be_valid
  end

  it "すべて記載されていればバリデーションが通る" do
    task = Task.new(
                user_id:10,
                title: 'OK' ,
                content:'OK',
                status:'着手',
                expired_at: '3/1',
                priority:'high')
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
