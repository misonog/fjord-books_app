# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # sign_in ヘルパーを利用するため
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:test_user)
    sign_in @user
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get show' do
    get user_url(@user)
    assert_response :success
  end
end
