require 'rails_helper'
RSpec.feature "タスク管理機能", type: :feature do
  before do
    FactoryBot.create(:user)
      visit root_path
          fill_in 'session_email', with: 'test@test.com'
          fill_in 'session_password', with: 'test'
          click_button 'Login'
          expect(page).to have_content 'ログインしました'
  end

  background do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
  end

  scenario "タスク一覧のテスト" do
    visit tasks_path
    expect(page).to have_content 'Factoryタイトル1'
    expect(page).to have_content 'Factoryコンテント1'
    expect(page).to have_content 'Factoryタイトル2'
    expect(page).to have_content 'Factoryコンテント2'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'task_title', with: 'title_test'
    fill_in 'task_content', with: 'content_test'
    fill_in 'task_expired_at', with: '1/31'
    select '着手',from:'task_status'
    select '低',from: 'task_priority'
    click_button '登録する'
    expect(page).to have_content 'content_test'
  end

  scenario "タスク詳細のテスト" do
    visit root_path
    all('tr')[3].click_link '詳細'
    expect(page).to have_content 'Factoryコンテント2'
    visit root_path
    all('tr')[2].click_link '詳細'
    expect(page).to have_content 'Factoryコンテント1'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit root_path
     expect(Task.order("created_at DESC").map(&:id)).to eq [12, 11, 10]
  end

  scenario "タスクが終了期限の降順に並んでいるかのテスト" do
    visit root_path
    click_link "終了期限でソートする"
    expect(Task.order("expired_at DESC").map(&:id)).to eq [12, 11, 10]
  end

  scenario "タスクが優先度の降順に並んでいるかのテスト" do
    visit root_path
    click_link "優先度でソートする"
    expect(Task.order("priority DESC").map(&:id)).to eq [12, 11, 10]
  end

  scenario "ラベルの検索機能" do
    visit root_path
    task1 = FactoryBot.create(:association_task)
    FactoryBot.create(:task_label,task: task1)
    select 'ラベル3',from: 'task_label_id'
    click_button "検索"
    expect(page).to have_content 'Factoryコンテント4'
  end
end
