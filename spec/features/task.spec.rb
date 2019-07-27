require 'rails_helper'
RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  scenario "タスク一覧のテスト" do
    visit root_path
    expect(page).to have_content 'Factoryタイトル1'
    expect(page).to have_content 'Factoryコンテント1'
    expect(page).to have_content 'Factoryタイトル2'
    expect(page).to have_content 'Factoryコンテント2'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'タスク名', with: 'title_test'
    fill_in '内容', with: 'content_test'
    click_button '登録する'
    expect(page).to have_content 'content_test'
  end

  scenario "タスク詳細のテスト" do
    visit root_path
    all('div')[1].click_link '詳細'
    expect(page).to have_content 'Factoryコンテント1'
    visit root_path
    all('div')[0].click_link '詳細'
    expect(page).to have_content 'Factoryコンテント2'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit root_path
     expect(Task.order("created_at DESC").map(&:id)).to eq [9,8]
  end
end
