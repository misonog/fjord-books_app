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
end
