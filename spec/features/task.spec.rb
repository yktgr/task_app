
require 'rails_helper'
RSpec.feature "タスク管理機能", type: :feature do

  scenario "タスク一覧のテスト" do
    Task.create!(title:'title_test',content:'content_test')
    Task.create!(title:'title_test2',content:'content_test2')
    visit root_path

    expect(page).to have_content 'content_test'
    expect(page).to have_content 'content_test2'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'Title', with: 'title_test'
    fill_in 'Content', with: 'content_test'
    click_button '投稿'
    expect(page).to have_content 'content_test'
  end

  scenario "タスク詳細のテスト" do
    Task.create!(title:'title_test',content:'content_test')
    visit root_path
    click_link '詳細'
    expect(page).to have_content 'content_test'
  end
end


RSpec.feature "タスク管理機能", type: :feature do
  background do
    Task.create!(title:)
  end
  scenario "タスク一覧のテスト" do
    # タスク一覧のテスト
  end

  scenario "タスク作成のテスト" do
    # タスク作成のテスト
  end

  scenario "タスク詳細のテスト" do
    # タスク詳細のテスト
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    # ここにテスト内容を記載する
  end
endß
