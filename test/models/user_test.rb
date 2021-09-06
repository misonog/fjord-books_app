require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: 'user@example.com', password: 'password')
  end

  test '郵便番号は7桁の数字でなければならない' do
    @user.zip_code = 1234567
    assert @user.valid?
  end

  test '郵便番号は7桁でなければならない' do
    @user.zip_code = 12345678
    assert_not @user.valid?
  end

  test '郵便番号は数字のみでなければならない' do
    @user.zip_code = '123-4567'
    assert_not @user.valid?
  end
end
