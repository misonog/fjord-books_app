# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'user@example.com', password: 'password')
  end

  test '郵便番号は存在していなくてもよい' do
    @user.zip_code = nil
    assert @user.valid?
  end

  test '郵便番号は7桁の数字でなければならない' do
    @user.zip_code = 123_456_7
    assert @user.valid?
  end

  test '郵便番号は7桁でなければならない' do
    @user.zip_code = 123_456_78
    assert_not @user.valid?
  end

  test '郵便番号は数字のみでなければならない' do
    @user.zip_code = '123-4567'
    assert_not @user.valid?
  end
end
