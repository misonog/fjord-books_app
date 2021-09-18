# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @user = users(:alice)
    @report = reports(:alice)
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: 'password'
    click_button 'ログイン'
    assert_text 'ログインしました。'
  end

  test '日報を書く' do
    visit new_report_path
    fill_in 'タイトル', with: 'テスト投稿'
    fill_in '内容', with: 'テスト投稿です。'
    click_button '登録する'
    assert_text '日報が作成されました。'
    assert_selector 'h1', text: '日報の詳細'
  end

  test '日報を編集する' do
    visit report_path(@report)
    assert_selector 'h1', text: '日報の詳細'

    click_on '編集', match: :prefer_exact
    fill_in 'タイトル', with: '更新テスト'
    fill_in '内容', with: @report.content
    click_on '更新する'
    assert_text '日報が更新されました。'
    assert_text '更新テスト'
  end

  test '日報を削除する' do
    visit reports_path
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
