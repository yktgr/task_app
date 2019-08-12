require 'rails_helper'
RSpec.feature "ユーザー機能", type: :feature do

  background do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end

  scenario "ユーザー登録" do
    visit new_user_path
        fill_in 'user_name', with: 'ユーザーテスト'
        fill_in 'user_email', with: 'user@usertest.com'
        fill_in 'user_password', with: 'usrstest'
        fill_in 'user_password_confirmation', with: 'usrstest'
        click_button '登録する'
        expect(page).to have_content 'タスク一覧'
    end

    scenario "ログイン機能" do
      visit root_path
          fill_in 'session_name', with: 'test'
          fill_in 'session_email', with: 'test@test.com'
          fill_in 'session_password', with: 'test'
          click_button 'Login'
          expect(page).to have_content 'ログインしました'
    end

    scenario "ログアウト機能" do
      visit root_path
          fill_in 'session_name', with: 'test'
          fill_in 'session_email', with: 'test@test.com'
          fill_in 'session_password', with: 'test'
          click_button 'Login'
          click_link 'Logout'
          expect(current_path).to eq "/sessions/new"
    end

    scenario "未ログイン時のアクセス制限" do
      visit tasks_path
      expect(page).to have_content 'ログインが必要です'
    end

    scenario "ログイン時のアクセス制限" do
      visit root_path
      fill_in 'session_name', with: 'test2'
      fill_in 'session_email', with: 'test2@test.com'
      fill_in 'session_password', with: 'test2'
      click_button 'Login'

      all('tr')[2].click_link '詳細'
      expect(page).to have_content '権限がありません'
      all('tr')[2].click_link '編集'
      expect(page).to have_content '権限がありません'
      all('tr')[2].click_link '削除'
      expect(page).to have_content '権限がありません'

      all('tr')[3].click_link '詳細'
      expect(page).to have_content '権限がありません'
      all('tr')[3].click_link '編集'
      expect(page).to have_content '権限がありません'
      all('tr')[3].click_link '削除'
      expect(page).to have_content '権限がありません'
    end
end
