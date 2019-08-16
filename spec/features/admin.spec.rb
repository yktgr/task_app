require 'rails_helper'
RSpec.feature "管理機能", type: :feature do

  before do
    FactoryBot.create(:admin_user)
      visit root_path
          fill_in 'session_email', with: 'admin@admin.com'
          fill_in 'session_password', with: 'admin'
          click_button 'Login'
          expect(page).to have_content 'ログインしました'
  end

  background do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end


    scenario "ユーザー作成" do
      visit admin_users_path
        click_link 'ユーザー作成'
        fill_in 'user_name', with: 'ユーザーテスト'
        fill_in 'user_email', with: 'user@usertest.com'
        fill_in 'user_password', with: 'usrstest'
        fill_in 'user_password_confirmation', with: 'usrstest'
        click_button '登録する'
        expect(page).to have_content 'ユーザー管理'
        expect(page).to have_content 'ユーザーテスト'
    end

    scenario "ユーザー詳細画面" do
      visit admin_users_path
      all('tr')[2].click_link '詳細'
      expect(page).to have_content 'test@test.com'
    end

    scenario "ユーザー編集" do
      visit admin_users_path
      all('tr')[3].click_link '編集'
      fill_in 'user_name', with: '名前変更'
      click_button '更新する'
      expect(page).to have_content '編集しました'
      expect(page).to have_content '名前変更'
    end

    scenario "ユーザー削除" do
      visit admin_users_path
      all('tr')[3].click_link '削除'
      expect(page).to have_content '削除しました'
    end

end
