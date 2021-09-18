# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:test_user)
  end

  test 'login and logout' do
    visit root_path
    assert page.assert_current_path(new_user_session_path)
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: 'password'
    click_button 'ログイン'
    assert page.assert_current_path(root_url)
    click_link 'ログアウト'
    assert page.assert_current_path(new_user_session_path)
  end

  test 'visiting the user index' do
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: 'password'
    click_button 'ログイン'
    visit users_path
    assert_selector 'h1', text: 'ユーザー'
  end

  test 'updating a user' do
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: 'password'
    click_button 'ログイン'
    visit users_path
    click_link '編集'

    fill_in '現在のパスワード', with: 'password'
    fill_in '郵便番号', with: 123_456_7
    click_on '更新'

    assert_text 'アカウント情報を変更しました。'
    assert page.assert_current_path(user_path(@user))
  end
end
